import { Component, OnInit } from '@angular/core';
import {SecurityService} from "../security.service";
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-security-home',
  templateUrl: './security-home.component.html',
  styleUrls: ['./security-home.component.css']
})
export class SecurityHomeComponent  {
  private shirtCollection: AngularFirestoreCollection<any>;
  shirts: Observable<any[]>;
  lostFoundLists:any[];
  constructor(private readonly afs: AngularFirestore) {
    this.shirtCollection = afs.collection<any>('lostitems');
    // .snapshotChanges() returns a DocumentChangeAction[], which contains
    // a lot of information about "what happened" with each change. If you want to
    // get the data and the id use the map operator.
    this.shirts = this.shirtCollection.snapshotChanges().pipe(
      map(actions => actions.map(a => {
        const data = a.payload.doc.data() as any;
        const id = a.payload.doc.id;
        return { id, ...data };
      }))
    );
      this.shirts.subscribe((values) => {
        this.lostFoundLists = values;
        console.log(this.lostFoundLists);
      })
  }

  deleteItem(key){
    console.log(key)
    this.afs.doc("lostitems/"+key).delete();
    this.shirts = this.shirtCollection.snapshotChanges().pipe(
      map(actions => actions.map(a => {
        const data = a.payload.doc.data() as any;
        const id = a.payload.doc.id;
        return { id, ...data };
      }))
    );
      this.shirts.subscribe((values) => {
        this.lostFoundLists = values;
        console.log(this.lostFoundLists);
      })
  }

}
