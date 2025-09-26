import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { 
  createUser, 
  findUserByEmail, 
  incrementFailedAttempts, 
  resetFailedAttempts, 
  lockAccount 
} from '../models/userModel.js';

const MAX_FAILED_ATTEMPTS = 3;

export const register = async (req, res) => {
  try {
    const { full_name, email, password, role } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = await createUser(full_name, email, hashedPassword, role);
    res.status(201).json({ message: 'User registered successfully', user });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await findUserByEmail(email);

    if (!user) return res.status(404).json({ message: 'User not found' });

    if (user.account_locked) {
      return res.status(403).json({ message: 'Account locked due to multiple failed login attempts' });
    }

    const isValid = await bcrypt.compare(password, user.password_hash);
    if (!isValid) {
      await incrementFailedAttempts(user.user_id);

      if (user.failed_attempts + 1 >= MAX_FAILED_ATTEMPTS) {
        await lockAccount(user.user_id);
        return res.status(403).json({ message: 'Account locked due to multiple failed login attempts' });
      }

      return res.status(401).json({ message: 'Invalid password' });
    }

    // Reset attempts after successful login
    await resetFailedAttempts(user.user_id);

    const token = jwt.sign(
      { user_id: user.user_id, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );
    res.json({ message: 'Login successful', token });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
