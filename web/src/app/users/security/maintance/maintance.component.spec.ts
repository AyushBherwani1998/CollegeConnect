import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MaintanceComponent } from './maintance.component';

describe('MaintanceComponent', () => {
  let component: MaintanceComponent;
  let fixture: ComponentFixture<MaintanceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MaintanceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MaintanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
