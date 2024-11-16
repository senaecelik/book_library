import 'package:book_library/features/auth/register/data/datasource/remote/register_remote_data_source.dart';
import 'package:book_library/features/auth/register/data/model/user_model.dart';
import 'package:book_library/features/auth/register/domain/entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  RegisterRemoteDataSourceImpl(this.firebaseAuth, this.firebaseFirestore);

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<UserModel?> createUser(UserEntity userEntity) async {
    try {
      final userCollection = firebaseFirestore.collection("users");
      final uid = await getCurrentUid();
      final userDoc = await userCollection.doc(uid).get();

      // Yeni kullanıcı modelini oluştur
      final newUser = UserModel(
        id: uid,
        firstName: userEntity.firstName,
        lastName: userEntity.lastName,
        email: userEntity.email,
      );

      if (!userDoc.exists) {
        // Kullanıcı mevcut değilse Firestore'a ekle
        await userCollection.doc(uid).set(newUser.toJson());
      } else {
        // Kullanıcı mevcutsa bilgilerini güncelle
        await userCollection.doc(uid).update(newUser.toJson());
      }

      return newUser; // Başarılıysa UserModel döndür
    } catch (error) {
      debugPrint("Error while creating user: $error");
      return null;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(UserEntity user) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );

      if (result.user?.uid != null) {
        // Kullanıcı oluşturulmuşsa, Firestore'a ekleyelim
        await createUser(user);
      } else {
        throw Exception("User creation failed");
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        rethrow;
      } else {
        rethrow;
      }
    }
  }
}
