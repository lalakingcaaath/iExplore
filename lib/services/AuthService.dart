import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // GET USER DATA
  User? get user => _auth.currentUser;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<User?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Failed to login: ';
      switch (e.code) {
        case 'user-not-found':
          errorMessage += 'No user found for that email.';
          break;
        case 'too-many-requests':
          errorMessage +=
              'Temporarily disabled due to many failed login attempts. Please try again later.';
          break;
        case 'invalid-credential':
          errorMessage += 'Wrong email or password.';
          break;
        default:
          errorMessage += 'An error occurred (${e.code}).';
      }
      throw FirebaseAuthException(message: errorMessage, code: e.code);
    } catch (e) {
      // Handle other exceptions
      throw FirebaseAuthException(
        message: 'Failed to login: ${e.toString()}',
        code: 'unknown-error',
      );
    }
  }

  Future<User?> registerUser(
      String name, String email, String password, String confirmPass) async {
    try {
      // Check if password matches the confirmed password
      if (password != confirmPass) {
        throw FirebaseAuthException(
          code: 'password-mismatch',
          message: 'Password and Confirm Password do not match.',
        );
      }

      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user object from the userCredential
      User? user = userCredential.user;

      // Update display name after user is created
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload(); // Refresh the user data
      }
      print('User: ${user}');
      print('_auth User: ${_auth.currentUser}');
      // Return the registered user
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Failed to register: ';
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage += 'Email is already in use.';
          break;
        case 'invalid-email':
          errorMessage += 'Invalid email.';
          break;
        case 'operation-not-allowed':
          errorMessage += 'Operation is not allowed.';
          break;
        case 'weak-password':
          errorMessage += 'Weak Password.';
          break;
        case 'password-mismatch':
          errorMessage += 'Password and Confirm Password do not match.';
          break;
        default:
          errorMessage += 'An error occurred (${e.code}).';
      }

      // Throw FirebaseAuthException with custom error message
      throw FirebaseAuthException(
        code: e.code,
        message: errorMessage,
      );
    } catch (e) {
      // Handle other exceptions
      throw FirebaseAuthException(
        code: 'unknown-error',
        message: 'Failed to register: ${e.toString()}',
      );
    }
  }

  Future<bool> changeName(String changed_name) async { 
    try {
      User? user = _auth.currentUser;
      await user!.updateDisplayName(changed_name);
      await user.reload();
      return true;
    } catch (e) {
      print('Failed to change name ${e}');
      return false;
    }
  }

  Future<bool> logOutUser() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print('Failed to sign out ${e}');
      return false;
    }
  }
}
