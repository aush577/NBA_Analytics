import { Component, ElementRef } from '@angular/core';
import {SlimLoadingBarService} from 'ng2-slim-loading-bar';
import { NavigationCancel,
        Event,
        NavigationEnd,
        NavigationError,
        NavigationStart,
        Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  // currPath = window.location.href;
  // atHome = (this.currPath == "http://localhost:4200");
  title = 'nbaAnalytics';
  constructor(private _loadingBar: SlimLoadingBarService, private _router: Router, private elementRef: ElementRef) {
    // console.log(this.currPath);
    this._router.events.subscribe((event: Event) => {
      this.navigationInterceptor(event);
    });

    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor = 'rgba(211, 211, 211, 0.4)';
  }
  private navigationInterceptor(event: Event): void {
    if (event instanceof NavigationStart) {
      this._loadingBar.start();
    }
    if (event instanceof NavigationEnd) {
      this._loadingBar.complete();
    }
    if (event instanceof NavigationCancel) {
      this._loadingBar.stop();
    }
    if (event instanceof NavigationError) {
      this._loadingBar.stop();
    }
  }
}