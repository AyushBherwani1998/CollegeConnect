import { Component, OnInit } from '@angular/core';
import {AuthService} from "../auth.service";
import {NgForm} from "@angular/forms";
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  public errorMsg:string = "";
  constructor(private authService:AuthService) { }

  ngOnInit() {
  }

  onSubmit(form:NgForm){
    let email = form.value.email;
    let password = form.value.password;
    this.authService.signin(email,password).catch(err => {
     
        this.errorMsg = err.message;
      
    });
  }

}
