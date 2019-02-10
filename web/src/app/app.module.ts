import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AngularFireModule } from 'angularfire2';
import { AngularFireDatabaseModule } from 'angularfire2/database';
import { environment } from '../environments/environment';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { SignupComponent } from './auth/signup/signup.component';
import { LoginComponent } from './auth/login/login.component';
import {FormsModule} from "@angular/forms";
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { AngularFireStorageModule } from '@angular/fire/storage';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { SecurityComponent } from './users/security/security.component';
import {authGuard} from "./shared/guards/auth-guard.service";
import { MaintanceComponent } from './users/security/maintance/maintance.component';
import { SecurityHomeComponent } from './users/security/security-home/security-home.component';
import { HomeComponent } from './home/home.component';
import { AuthorityComponent } from './users/authority/authority.component';
@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    SignupComponent,
    LoginComponent,
    SecurityComponent,
    MaintanceComponent,
    SecurityHomeComponent,
    HomeComponent,
    AuthorityComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    AngularFireDatabaseModule,
    AngularFireModule.initializeApp(environment.firebase),
    AngularFirestoreModule,
    AngularFireStorageModule,
    AngularFireAuthModule
  ],
  providers: [authGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
