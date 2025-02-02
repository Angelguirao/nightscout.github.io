---
orphan: true
---

a) Select `Add new service`.

<img src="/vendors/northflank/img/Northflank08.png" width="400px" /></br>

</br>

b) Don't change anything and scroll down to `Service name`. Click `Suggest random name`.

<img src="/vendors/northflank/img/Northflank09.png" width="600px" /></br>

</br>

c) Select your `cgm-remote-monitor` and the `master` branch.

<img src="/vendors/northflank/img/Northflank10.png" width="600px" /></br>

</br>

d) In `Buid options` select `Buildpack`.

<img src="/vendors/northflank/img/Northflank11.png" width="600px" /></br>

</br>

e) Expand `Variables` and click `Add variable`.

<img src="/vendors/northflank/img/Northflank12.png" width="600px" /></br>

</br>

f) Setup your Nightscout core variables.

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.



```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

<img src="/vendors/northflank/img/Northflank13.png" width="600px" /></br>

Click `Add variable` each time to add another one.

</br>

#### Dexcom Bridge

g) If you use [Dexcom `bridge`](/troubleshoot/dexcom_bridge/) you need to configure these two variables with your Dexcom credentials:

<img src="/vendors/northflank/img/Northflank14.png" width="600px" /></br>

<img src="/vendors/northflank/img/Northflank15.png" width="600px" /></br>

If you're using Dexcom Share in the US you should put **US**, in **any other case it must be EU**.  
If you don't see it proposed at this point you'll need to **browse the list below to find it and modify it**.

<img src="/vendors/northflank/img/Northflank16.png" width="600px" /></br>

**Remember to add `bridge` at the end of the `enable` variable in the list below.**

</br>

```{admonition} MOST COMMON ERRORS
:class: hint
The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](/troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.
```

```{admonition} Password
:class: note
*Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*
```

```{hint}
You need to have at least one follower to use Dexcom Share. See [here](/uploader/setup.md#dexcom).
```

</br>

h) Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="/vendors/northflank/img/Northflank17.png" width="600px" /></br>

</br>

i) You can add alarms values. See [here](/nightscout/setup_variables.md#alarms) for the meaning of each one.

<img src="/vendors/northflank/img/Northflank18.png" width="600px" /></br>

</br>

j) If you want to ensure that ONLY someone with permission to view your site (e.g., a token or the `API_SECRET`) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](/nightscout/setup_variables.md#auth_default_roles) variable in as `denied`.  
If you want your site to be visible to anybody leave it as `readable`.

<img src="/vendors/northflank/img/Northflank19.png" width="600px" /></br>

</br>

k) In [`ENABLE`](/nightscout/setup_variables.md#enable), copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

**If you are using your Dexcom share account as a data source** also add `bridge` at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

<img src="/vendors/northflank/img/Northflank20.png" width="600px" /></br>

</br>

l) You can modify the variables values, check the [documentation](../../../nightscout/setup_variables) for the meaning of each one.

</br>

m) add a 3 to 8 letter code to your URL.

<img src="/vendors/northflank/img/Northflank21.png" width="600px" /></br>

</br>

n) Scroll down and click: `Create Service`

<img src="/vendors/northflank/img/Northflank22.png" width="600px" /></br>

</br>

o) You now need to add a payment method.

<img src="/vendors/northflank/img/Northflank23.png" width="400px" /></br>

</br>

p) Wait until your build completes. You will see a green cloud when done, it will take less than 15 minutes.

<img src="/vendors/northflank/img/Northflank24.png" width="400px" /></br>

</br>

</br>

### Step 4: Attach your database to your Nightscout site

</br>

a) Browse back into your project `Service ` then `Environment`, click `Edit`.

<img src="/vendors/northflank/img/Northflank25.png" width="600px" /></br>

</br>

b) Select `Add variable ` at the end of the list.

<img src="/vendors/northflank/img/Northflank26.png" width="300px" /></br>

</br>

c) Name it `MONGODB_URI` and paste the string you obtained at **Step 0**.

<img src="/vendors/northflank/img/Northflank27.png" width="600px" /></br>

</br>

d) Click `Update and restart` bottom right.

<img src="/vendors/northflank/img/Northflank28.png" width="200px" /></br>

</br>