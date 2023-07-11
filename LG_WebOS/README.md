# ClevertapLGWebOS
This is a sample project that shows how to integrate CleverTap Web SDK  With Samsung Tizen

Following are the steps, 

### Step 1 - Install WebOS CLI - [CLI Install Link](https://webostv.developer.lge.com/develop/tools/cli-installation)

### Step 2 - Add the extension for [webOS TV](https://marketplace.visualstudio.com/items?itemName=webOSTVSDK.webostv) in Visual Studio Code from VSCode Extension Marketplace

### Step 3 - Install Simulator as mentioned [here](https://webostv.developer.lge.com/develop/tools/simulator-installation) 

### Step 4 - Create the sample Application 

Through VScode  : [App Development](https://webostv.developer.lge.com/develop/tools/vsce-dev-guide#app-development)

Through CLI : [App Development](https://webostv.developer.lge.com/develop/tools/cli-dev-guide)

### Step 5 -  In sample application update the index.html as required. Add the clevertap script in index.html

### Step 6 -  Open simulator .app file inside the Simulator folder as mentioned in Step 2.



### Step 7 -  In Simulator. Go to File → Launch App → select the folder of sampleApp  which has .ipk file 

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
```

#### Push Event With Properties

```
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
