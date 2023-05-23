# Accelerate Android App Delivery via Bitrise CI/CD Pipelines

## Introduction
**Bitrise** is a Continuous Integration and Delivery (CI/CD) Platform as a Service (PaaS) with a main focus on mobile app development (iOS, Android, React Native, Flutter, and so on). It is a collection of tools and services to help you with the development and automation of your software projects.
## Why use Bitrise?
Using a CI/CD platform like Bitrise for your Android app development has many benefits:
1. **Efficiency:** Bitrise automates many manual steps in the development, testing, and deployment process, saving you time and effort.
2. **Faster Feedback:** With Bitrise, you get feedback on your app's performance and functionality much faster than manual testing, so you can address issues as they arise.
3. **Consistency:** Bitrise ensures that all your builds are consistent, regardless of who runs them. This reduces the chances of introducing errors or inconsistencies in your app.
4. **Integration:** Bitrise integrate with other development tools like GitHub, Jira, and Slack, making it easier to incorporate them into your existing workflow.
5. **Scalability:** It can scale to accommodate projects of any size, from small apps to enterprise-level applications.

Overall, using Bitrise can help you streamline your Android app development process, improve the quality of your app, and stay ahead of the competition.
## Setting Up a Bitrise Account
You can create a **Bitrise** account by visiting the Bitrise Sign-up page [here](https://app.bitrise.io/users/sign_up). You can sign up using your **Google** or **GitHub** account or create a new Bitrise account using your email address. Signing up with either of the Git service providers means you connect your Bitrise account to your account on that service provider. With a connected account, you can grant Bitrise access to any of your repositories on that account.

### Connecting Git Accounts to Bitrise
After signing up, you can connect your Bitrise account to all three supported Git service providers. For example, after you sign up with **GitHub**, you can connect your **Bitrise** account to both your **GitLab** and **Bitbucket** accounts and access any repositories you have on those accounts. To connect an account:
- Go to Bitrise [Profile](https://app.bitrise.io/me/profile#/edit_profile) page by clicking in top-right corner
- Click on the Settings icon to go to the profile page
- Click on the toggle switch to connect the desired Git account
![Connect Git Accounts](./images/bitrise_connect_git_accounts.png)

## Adding an Android app to Bitrise
1. Go to your Bitrise [Dashboard](https://app.bitrise.io/dashboard).
2. Click the + sign on the top menu bar and select Add New App on the web UI, which takes you to the [Create New App page](https://app.bitrise.io/apps/add).
![Add New App](./images/bitrise_add_new_app.png "New app page")

3. Select Workspace and set the privacy of the app to either Private or Public and click Next.
![Select WorkSpace and Privacy](./images/new_app_select_workspace.png)

4. Choose Git Provider and select your repository from the popup list.
![Select Provider](./images/new_app_select_repository.png)
5. When prompted to set up repository access, click No for auto-add SSH key or manually copy the provided SSH key to Git Provider settings.
6. Select your main branch from the dropdown and choose **Yes, auto-detect configuration**. Bitrise will now start validating your project to detect it as an Android Project. 
7. The Bitrise Scanner selects the main module of your project by default. If there are more modules to choose from in the Module list, select a module that works best for your project.
8. Select a variant for building (you can Select All Variants which will generate all variants in Artifacts) and select a variant for testing too. You can find the list of your build variants from android studio.
![Find Build Variants list](./images/android_studio_build_variants_list.png)
9. Click **Register a Webhook for me** when prompted so that Bitrise can start a build automatically when code is pushed to your repository. Skip this part if you want to manually trigger builds.
![Register Webhook](./images/bitrise_register_webhook.png)

Congratulations! Bitrise will kick off your first test build now!

## Signing your Android App
Now that you have successfully built your Android project, it's time to sign your app for production release.
### Add Code Signing Files
1. [Generate a keystore file](https://developer.android.com/studio/publish/app-signing#generate-key) or use existing if you have one already.
2. Go to your Bitrise [Dashboard](https://app.bitrise.io/dashboard) and select your Android app.
3. Click on **Edit workflow**. 
![Edit Workflow button](./images/bitrise_edit_workflow.png) 
4. Go to the **Code Signing & Files** tab, drag and drop your keystore file to the ANDROID KEYSTORE FILE field.
5. Fill out the **Keystore password**, **Keystore alias**, and **Private key password** fields and click Save metadata.
![Add CodeSigning Files](./images/bitrise_add_code_signing_files.png)

### Add Android **Build** and **Sign** steps
1. Go to **Workflows** tab and choose a workflow from the dropdown.
![Select Main Worflow](./images/bitrise_select_workflow.png)
2. Add **Android Build** step after **Android Unit Tests** OR **Save Gradle Cache**. Just make sure it is before **Android Sign** and **Deploy** steps.
![Add Android Build Step](./images/bitrise_add_android_build_step.png)

3. Select **Android Build** step and Fill out the **Input Variables** section if the values are missing.
![Fill Android Build Step](./images/bitrise_fill_android_build_step.png)

4. Add **Android Sign** step after **Android Build**. There is no need to change any input variables. Just make sure the **Keystore** file configuration is correct.

Your workflow steps order should now look like the figure below. Hit **Run Workflow**. Once the build finishes, you have now successfully **Signed** your Android app using **Bitrise**.


![Bitrise Final Workflow Step](./images/bitrise_android_app_signing_steps.png)

### Access App Files and Test Reports
After the build finishes, Bitrise will produce artifacts: for example, test reports, images, and executable app binaries. To check out the artifacts generated during a build:
1. Go to your app page from the Bitrise [Dashboard](https://app.bitrise.io/dashboard).
2. Click on the latest **Build** from the list.

![Bitrise App Builds List](./images/bitrise_app_builds_list.png)

3. Switch to **Artifacts** tab to access **APK/AAB** files.

![Bitrise App Artifacts](./images/bitrise_app_artifacts.png)

## Conclusion
In conclusion, using Bitrise for your Mobile apps can significantly improve the efficiency and quality of your app development process. With Bitrise, you can automate many of the manual steps involved in building, testing, and deploying your app, saving you time and effort while ensuring consistent, high-quality results. Whether you're a solo developer or part of a larger team, Bitrise can help you streamline your Android app development process, reduce errors, and bring your app to market faster.

Thank you for reading this article. Recommend and share if you enjoyed it. Follow us on [Facebook](https://www.facebook.com/numericaideas), [Twitter](https://twitter.com/numericaideas), and [LinkedIn](https://www.linkedin.com/company/numericaideas) for more content.