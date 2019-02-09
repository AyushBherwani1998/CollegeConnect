import { Injectable, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/firestore';
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class SecurityService {

  constructor(private afs:AngularFirestore) { }

  getLostFound(){
    return this.afs.collection("lostfound").get().toPromise();
  }
  


}
