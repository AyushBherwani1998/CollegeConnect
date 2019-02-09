import { Component, OnInit } from '@angular/core';
import {SecurityService} from "./security.service";
@Component({
  selector: 'app-security',
  templateUrl: './security.component.html',
  styleUrls: ['./security.component.css']
})
export class SecurityComponent implements OnInit {
 
  lostFoundLists = [];
  constructor(private securityService:SecurityService) { }

  ngOnInit() {
    this.securityService.getLostFound().then((data) => {
      this.lostFoundLists = data.docs;
    })
   
  }

}
