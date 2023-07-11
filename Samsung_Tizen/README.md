# Samsung Tizen : Integrating CleverTap Web SDK
This is a sample project that shows how to integrate CleverTap Web SDK  With Samsung Tizen

Following are the steps, 

### Step 1 - Download the Tizen Studio DMG file.

### Step 2 - Open the installer in complete the installation

### Step 3 - Open Package Manager. Install ‘TV Extensions-7.0’ in Extension SDK

### Step 4 - Create the sample project, and update the index.html as required. Add the clevertap script in index.html

### Step 5 - Run the project as ‘Tizen Web Simulator Application(Samsung TV)’

 

#### Initialise CleverTap 

   Add clevertap script in index.html file

```
<script type="text/javascript">
     var clevertap = {event:[], profile:[], account:[], onUserLogin:[], notifications:[], privacy:[]};
 // replace with the CLEVERTAP_ACCOUNT_ID with the actual ACCOUNT ID value from your Dashboard -> Settings page
clevertap.account.push({"id": "CLEVERTAP_ACCOUNT_ID"});
clevertap.privacy.push({optOut: false}); //set the flag to true, if the user of the device opts out of sharing their data
clevertap.privacy.push({useIP: false}); //set the flag to true, if the user agrees to share their IP data
 (function () {
         var wzrk = document.createElement('script');
         wzrk.type = 'text/javascript';
         wzrk.async = true;
         wzrk.src = 'https://d2r1yp2w7bby2u.cloudfront.net/js/clevertap.min.js';
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(wzrk, s);
  })();
</script>
```

#### Send User Profile

```
clevertap.onUserLogin.push({
 "Site": {
   "Name": "Jack Montana",            // String
   "Identity": 61026032,              // String or number
   "Email": "jack@gmail.com",         // Email address of the user
 }
})
```

#### Push Event

```
clevertap.event.push("Product viewed");

Push Event With Properties

clevertap.event.push("Product viewed", {
    "Product name": "Casio Chronograph Watch",
    "Category": "Mens Accessories",
    "Price": 59.99,
    "Date": new Date()
});
```

#### Add Profile Properties

```
cleverTapAPI.addMultiValueForKey("userTVCount","1")
```

#### Remove Profile Properties

```
cleverTapAPI.removeMultiValueForKey("userTVCount","1")
```


### CleverTap Push Notifications do not work on Tizen as the Service worker works only on HTTPS connection or localhost. Not on file://
