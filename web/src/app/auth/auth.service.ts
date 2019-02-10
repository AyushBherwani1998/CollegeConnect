import { Injectable } from '@angular/core';
import * as firebase from "firebase";
import { AngularFireAuth } from 'angularfire2/auth';
import {Router} from "@angular/router";
import {UsersServiceService} from "../users/users-service.service";
import {Observable} from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class AuthService {
     user: Observable<firebase.User>;
      uid:string;
      token:string;
      identity:string;
     constructor(private firebaseAuth: AngularFireAuth,private router:Router,private userService:UsersServiceService) {
       this.user = firebaseAuth.authState;
     }
   
     signup(email: string, password: string,identity:string) {
      return this.firebaseAuth
         .auth
         .createUserWithEmailAndPassword(email, password)
         .then(value => {
           console.log('Success!', value);
     
            this.firebaseAuth.user.subscribe((val) => {
              if(val){
                this.userService.addItem(val.uid,identity);
              }
              
           })
         })
          
     }
   
     signin(email: string, password: string) {
      return this.firebaseAuth
         .auth
         .signInWithEmailAndPassword(email, password)
         .then(value => {
           this.firebaseAuth.user.subscribe((uid) => {
            if(uid){
              this.uid = uid.uid;
              this.userService.getItem(this.uid).then((val) => {
                   val.docs.filter((doc) => {
                     if(doc.id === this.uid){
                       this.identity = doc.data().identity;
                       firebase.auth().currentUser.getIdToken().then((tk)=>{
                         this.token = tk;
                         let val = this.identity;
                         this.router.navigate([val]);
                       });
                     }
                   })
              })
            }
           })
         })
         
     }
   
     logout() {
       this.firebaseAuth
         .auth
         .signOut();
        this.token = undefined;
        this.router.navigate([""]);
     }

     isAuthenticated(){
      return this.token !== undefined;
     }

     getIdentity(){
       return this.identity;
     }
  
 }
 
