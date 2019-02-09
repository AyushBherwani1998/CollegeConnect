import {CanActivate} from "@angular/router";
import {Injectable} from "@angular/core";
import {AuthService} from "../../auth/auth.service";
import {Router} from "@angular/router";
@Injectable()
export class authGuard implements CanActivate{

constructor(private authService:AuthService,private router:Router){}
canActivate(){
let result = this.authService.isAuthenticated();
if(result===false){
this.router.navigate(["signup"]);
}
return result;
}

}