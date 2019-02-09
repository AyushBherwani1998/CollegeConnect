import { Injectable, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/firestore';
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class UsersServiceService{
  private itemsCollection: AngularFirestoreCollection;
  items;
  constructor(private afs: AngularFirestore) {
    this.itemsCollection = this.afs.collection('users');
  }
  addItem(id,identity) {
    this.itemsCollection.doc(id).set({
      id:id,
      identity:identity
    });
  }
  getItem(token){
   return this.afs.collection("users").get().toPromise();
  }
}
