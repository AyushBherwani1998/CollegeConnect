import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SecurityHomeComponent } from './security-home.component';

describe('SecurityHomeComponent', () => {
  let component: SecurityHomeComponent;
  let fixture: ComponentFixture<SecurityHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SecurityHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SecurityHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
