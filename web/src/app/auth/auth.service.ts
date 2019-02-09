import { Injectable } from '@angular/core';
import * as firebase from "firebase";
import { AngularFireAuth } from '@angular/fire/auth';
import { auth } from 'firebase/app';
import {Router} from "@angular/router";
@Injectable({
  providedIn: 'root'
})
export class AuthService {

  token:string;
  identity:string;
  constructor(private router:Router){}
  
  signup(email:string,password:string,identity:string){
     firebase.auth().createUserWithEmailAndPassword(email,password).catch((errors)=>{
          
     })
  }
  
  signin(email:string,password:string){
       firebase.auth().signInWithEmailAndPassword(email,password)
            .then((data) => {
            this.router.navigate(["recipes"]);
  
            firebase.auth().currentUser.getIdToken().then((tk)=>this.token = tk);
            
            }).catch((errors) => {
                 console.log(errors);
            })
  }
  
  getToken(){
       firebase.auth().currentUser.getIdToken()
            .then((data) => {
                 this.token = data;
            });
       return this.token;
  }
  
  isAuthenticated(){
       return this.token !== undefined;
  }
  
  logout(){
       firebase.auth().signOut();
       this.router.navigate([""])
       this.token = undefined;
  }
  
 }
 
