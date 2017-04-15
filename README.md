# WKWebViewExperiments
A project on which I tried many things with WKWebView
Below are the things tried

### Load an HTML from Resources folder
'loadUrl()' method loads the file from resources folder.

### Start.html
This file contains some controls to try different things.
* Post A Script Message!:- On clicking that, a "clicked" event get fired back, check console you will see"Received script message clicked"
* Click me :- Throws a JS alert, handled by WK delegates
* Go to Google:- Invokes a link

### WKWebScriptHandler
Events are registered here.'registerScriptsAndEvents()'
User scripts are added from local js file "hello.js" check 'fetchScript()' method

### Button Handling
Used IBAction to invoke JS Methods from native UI to webview js.

Hope its helpful
![image](https://cloud.githubusercontent.com/assets/6782228/25065270/6e207184-222a-11e7-8512-48bdcc9da79c.png)
![image](https://cloud.githubusercontent.com/assets/6782228/25065271/6fdd32c8-222a-11e7-9a7b-321b62a5cdcb.png)
