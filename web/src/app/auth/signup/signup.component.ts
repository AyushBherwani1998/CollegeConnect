import { Component, OnInit } from '@angular/core';
import {AuthService} from "../auth.service";
import {NgForm} from "@angular/forms";
@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
  public errorMsg:string = "";
  constructor(private authService:AuthService) { }

  ngOnInit() {
  }

  onSubmit(form:NgForm){
    let email = form.value.email;
    let password = form.value.password;
    let identity = form.value.identity;
    this.authService.signup(email,password,identity).catch((err) => {
      this.errorMsg = err.message
    })
  }

}
