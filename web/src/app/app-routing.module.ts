import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SignupComponent } from './auth/signup/signup.component';
import { LoginComponent } from './auth/login/login.component';
import { SecurityComponent } from './users/security/security.component';
import {authGuard} from "./shared/guards/auth-guard.service";
import { MaintanceComponent } from './users/security/maintance/maintance.component';
import { SecurityHomeComponent } from './users/security/security-home/security-home.component';
import { HomeComponent } from './home/home.component';
import { AuthorityComponent } from './users/authority/authority.component';
const routes: Routes = [
  {path:"",component:HomeComponent},
  {path:"signup",component:SignupComponent},
  {path:"login",component:LoginComponent},
  {path:"security",canActivate:[authGuard],component:SecurityHomeComponent},
  {path:"maintance",canActivate:[authGuard],component:MaintanceComponent},
  {path:"authority",canActivate:[authGuard],children:[
    {path:"",redirectTo:"appointment",pathMatch: 'full'},
    {path:"appointment",component:AuthorityComponent}
  ]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
