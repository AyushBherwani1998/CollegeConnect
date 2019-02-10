import { Component,OnInit } from '@angular/core';
import * as firebase from 'firebase/app';
import { AngularFirestore } from 'angularfire2/firestore';
import 'firebase/auth';
import 'firebase/database';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  ngOnInit(){
  }
}
