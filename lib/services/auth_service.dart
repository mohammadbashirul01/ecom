// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/models/user_model.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;


//   // Get current user
//   User? get currentUser => _auth.currentUser;

//   // Stream of UserModel based on auth state changes
//   Stream<UserModel> get userStream {
//     return _auth.authStateChanges().asyncMap((user) async {
//       if (user == null) return UserModel.empty();
//       return await _getUserData(user.uid);
//     });
//   }

//   // Get user data from Firestore
//   Future<UserModel> _getUserData(String uid) async {
//     try {
//       final doc = await _firestore.collection('users').doc(uid).get();
//       return UserModel.fromFirestore(doc.data(), doc.id);
//     } catch (e) {
//       print("Error getting user data: $e");
//       return UserModel.empty();
//     }
//   }

//   // Sign in with email and password
//   Future<UserModel> signIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
      
//       // Get user data from Firestore
//       DocumentSnapshot userDoc = await _firestore
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .get();

//       if (userDoc.exists) {
//         return UserModel.fromFirestore(userDoc.data() as Map<String, dynamic>, userDoc.id);
//       } else {
//         throw Exception('User document not found');
//       }
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw 'Login failed: ${e.toString()}';
//     }
//   }
  

//   // Sign up with email, password, and name
//   Future<UserModel> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Create user document in Firestore
//       UserModel user = UserModel(
//         uid: userCredential.user!.uid,
//         name: name,
//         email: email,
//         createdAt: DateTime.now(),
//       );

//       await _firestore
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set(user.toFirestore());

//       return user;
//     } on FirebaseAuthException catch (e) {
//       throw _handleAuthException(e);
//     } catch (e) {
//       throw "An unexpected error occurred";
//     }
//   }

//   // Sign out
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   // Helper method to handle auth exceptions
//   String _handleAuthException(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'invalid-email':
//         return 'The email address is invalid.';
//       case 'user-disabled':
//         return 'This user has been disabled.';
//       case 'user-not-found':
//         return 'No user found with this email.';
//       case 'wrong-password':
//         return 'Wrong password provided.';
//       case 'email-already-in-use':
//         return 'The email address is already in use.';
//       case 'operation-not-allowed':
//         return 'Email/password accounts are not enabled.';
//       case 'weak-password':
//         return 'The password is too weak.';
//       default:
//         return 'An unknown error occurred.';
//     }
//   }
// }