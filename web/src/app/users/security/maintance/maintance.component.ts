import { Component, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-maintance',
  templateUrl: './maintance.component.html',
  styleUrls: ['./maintance.component.css']
})
export class MaintanceComponent implements OnInit {

  private maintanceCollection: AngularFirestoreCollection<any>;
  maintance: Observable<any[]>;
 maintanceLists:any[];
  constructor(private readonly afs: AngularFirestore) {
    this.maintanceCollection = afs.collection<any>('clean');
    this.maintance = this.maintanceCollection.snapshotChanges().pipe(
      map(actions => actions.map(a => {
        const data = a.payload.doc.data() as any;
        const id = a.payload.doc.id;
        return { id, ...data };
      }))
    );
      this.maintance.subscribe((values) => {
        this.maintanceLists = values;
      })
  }

  ngOnInit() {
  }

  deleteIt(id){
    this.afs.doc("clean/"+id).delete();
    this.maintance = this.maintanceCollection.snapshotChanges().pipe(
      map(actions => actions.map(a => {
        const data = a.payload.doc.data() as any;
        const id = a.payload.doc.id;
        return { id, ...data };
      }))
    );
      this.maintance.subscribe((values) => {
        this.maintanceLists = values;
      })
  }

}
