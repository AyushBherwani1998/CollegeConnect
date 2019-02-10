import {CanActivate, CanActivateChild} from "@angular/router";
import {Injectable} from "@angular/core";
import {AuthService} from "../../auth/auth.service";
import {Router} from "@angular/router";
@Injectable()
export class authGuard implements CanActivate,CanActivateChild{

constructor(private authService:AuthService,private router:Router){}
canActivate(){
let result = this.authService.isAuthenticated();
console.log(result);
if(result===false){
this.router.navigate(["signup"]);
}
return result;
}
canActivateChild(){
let result = this.authService.isAuthenticated();
console.log(result);
if(result===false){
this.router.navigate(["signup"]);
}
return result;                                       
}

}