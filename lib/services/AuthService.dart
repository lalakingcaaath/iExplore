import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // GET USER DATA
  User get user => _auth.currentUser!;

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
}
