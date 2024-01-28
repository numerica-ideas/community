# A Beginner's Guide to Apache Maven
![featuredImage](./images/maven.png)

Maven is a build tool primarily used in Java projects to compile, test, and package code into JAR or WAR artifacts. It also provides a streamlined way to manage dependencies, generate documentation, and a host of other features.

In this article, we'll look at some of the core Maven concepts you should know as a beginner ; like commands to create, compile and package Maven projects, and also how dependencies and plugins work in Maven. Additionally, we will build a little project to tie everything together as we progress through the article. I hope you are excited about this, let's get right into the prerequisites.


## Prerequisites
To follow along, you need to have JDK(Java Development Kit) and Maven installed in your local environment — preferably the latest LTS versions.

Follow this link to get the latest version of JDK:
https://www.oracle.com/java/technologies/downloads/

And this link download Maven:
https://maven.apache.org/download.cgi

I decided not to include a setup guide as it would make this article rather lengthy, but there are plenty of resources online on how to do so and a search on Google or YouTube should do the job.


## Maven Commands

> The terminal is what we'll mainly be using to interface with Maven through out this guide. In places where we have to modify code/files, feel free to use any IDE or Text Editor of your choice.

To see if we installed Maven correctly, run the following command in your terminal:

```
mvn -v
```

If it displays the Maven version like this ⬇️, then you're good to go.

![display maven version](./images/1_maven_version.png)

### Creating A Maven Project
To create a Maven project, navigate to any directory of your choice and run the following command:

```
mvn archetype:generate -Dfilter=org.apache.maven.archetypes:
```

Let's understand what this command does before moving on. 
- `mvn archetype:generate` is used to create a new Maven project based on an archetype. But what is an archetype? Think of it as a template for creating Maven projects with a specific folder structure. We have archetypes for creating simple Java applications, Web applications, and Maven plugins, just to name a few. We could also create our own archetypes or use ones created by other developers.
- `-Dfilter=org.apache.maven.archetypes:` is a flag specifying the package where the archetypes would be gotten from. In this case, it is the **org.apache.maven.archetypes** package, the one officially provided by Maven.

To learn more about Maven archetypes, you can [checkout the official docs.](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html)

After running the command, some dependencies will be installed, then you will be prompted to provide some values. You can just provide the `groupId:` and `artifactId:`, and leave the rest as default. 

> As a best practice, it's important for the default **package name** to have the same value as the **groupId**. This is to maintain a consistent project structure and avoid conflicts in package names. That's how Maven sets it up by default.

Once your project has been created, navigate to the project directory and you should see a folder structure like this: 

![display maven project structure](./images/2_maven_project_structure.png)

It contains a `pom.xml` file and a `/src` directory.

- 📄 `pom.xml` : This is the file where we configure our maven project. It contains meta-data about our project, project dependencies, plugins, and so on. It is similar to the `package.json` file used in JavaScript projects. POM stands for **Project Object Model**.

- 📁 `/src` : This directory is where all the code and tests is stored.

### Compiling and Packaging Our Maven Project

Before we compile or package our project, we need to first understand Maven's lifecycle and its commands. The default Maven lifecycle has 8 major phases, and they are: Validate, Compile, Test, Package, Integration Test, Verify, Install and Deploy.

- `validate` : Checks the `pom.xml` file and verifies if it  has been configured properly.
- `compile` : Converts the `.java` source files into `.class` that can be executed by the JVM.
- `test` : Runs the unit tests.
- `package` : Uses the compiled code and packages it into a portable format like JAR.
- `integration-test` : Runs the integration tests.
- `verify` :  Run any checks on the results of integration tests to ensure quality criteria are met.
- `install` : Adds the package to the local Maven repository to be used as a dependency in other projects locally.
- `deploy` : Copies the final package to the remote repository for sharing with other developers and projects.

It is important to note that each command could execute one or more others as part of their operations. For example, if you run `test` behind the scenes it runs `compile` and `validate` too. This is an example of how to run any of the commands with Maven, in this case we're running the `package` command:

```
mvn package
```

Another command worth mentioning is  `clean` :
```
mvn clean
```

It basically removes everything generated by maven like the compiled executables and artifacts, and it's usually run alongside any of the other lifecycle commands like this:

```
mvn clean package
```

With that out of the way, now let's compile and package the project we created earlier. Go ahead and open the project in your favorite IDE or Text Editor, I am using VS Code. To compile the code, just run the following command in your terminal:

```
mvn compile
```

Did you notice a new directory was created called `/target`? it's the default folder in which Maven stores compiled files.

![project structure after compilation](./images/4_compiled_project.png)

The class file can be found in **/target/classes**.

What command do we use to package our project ? you guessed it

```
mvn package
```

After running this command, you should see a new JAR file in the **/target** directory. The name of this file is a combination of your **artifactId** and **version number**.

![jar artifact](./images/5_jar_file.png)

Sadly though, there isn't a direct way to run our code and see the output with Maven. However, we can do so with the help of a plugin and that's what we'll do in the section under plugins.


## Maven Dependencies

Dependencies are external pieces of code, or libraries we use in projects to perform specific tasks with ease. Maven offers a streamlined way of working with dependencies where we don't have to go out and download external libraries and manually import them into our project. We only tell Maven what dependencies we need, and it handles the rest, fetching the dependencies and making them available in the project.

All dependencies are managed in the **POM** file, inside an attribute called `<dependencies> </dependencies>`. If you open the **POM** file, you'd notice there is a dependency that comes by default and that is **junit**. JUnit is a unit testing library for Java.

![maven default dependencies](./images/6_pom_dependencies.png)

Let's add a dependency of a cool library called **cowsay**. All it does is print a cow on the terminal saying something. Copy this code and add it to the dependencies in your POM file.

```xml
<dependency>
	<groupId>com.github.ricksbrown</groupId>
	<artifactId>cowsay</artifactId>
	<version>1.1.0</version>
	<classifier>lib</classifier>
</dependency>
```

This is how it should look like after adding it.

![cowsay dependency in pom file](./images/7_adding_dependency.png)

> This dependency is fetched from the [Maven central repository](https://mvnrepository.com/artifact/com.github.ricksbrown/cowsay), which is the default, publicly available repository for getting Maven dependencies. We also have the option of working with other public repositories like [JFrog](https://jfrog.com/artifactory/), [AWS CodeArtifact](https://aws.amazon.com/codeartifact/), [JitPack](https://jitpack.io/) or even with a private repository within an organization.

Also, let's modify the code in our main class to use the **cowsay** library. In `/src/main/.../App.java`, replace the code with the one below. 

> Make sure you don't remove the package declaration

```java
import com.github.ricksbrown.cowsay.Cowsay;

public class App{

	public static void main(String[] args) {
		String[] cowArgs = new String[] { "Hello Mr Cow" };

		String cowString = Cowsay.say(cowArgs);

		System.out.printf(cowString);

	}
}
```

This is a simple program that will print a cow on the console with the message "Hello Mr Cow".


## Maven Plugins

Plugins are basically third-party utilities written by other developers to extend the capabilities of Maven. They are very powerful and can be helpful in many cases, like in our case where we need a way to run our code with Maven. It is possible to run the code from an IDE or Text Editor easily, however, we're just doing this to learn how plugins work in Maven.

In the POM file, declared plugins can be found inside the `<plugins>` attribute, which is nested under the `<pluginManagement>` attribute that is also nested under the `<build>` attribute. You should find many other plugins that came with this installation like the **maven-clean-plugin**, **maven-compiler-plugin**, etc.

The plugin we will use to run our code is called **exec-maven-plugin**. You can add the following code to your POM file, inside the `<plugins>` attribute. Make sure you replace `(groupId)` with your actual group ID.

```xml
<plugin>
	<groupId>org.codehaus.mojo</groupId>
	<artifactId>exec-maven-plugin</artifactId>
	<version>3.1.1</version>
	<configuration>
		<mainClass>(groupId).App</mainClass>
	</configuration>
</plugin>
```

Now the time we've eagerly been waiting for, running our code 😁. You can use the following commands to do so:

```
mvn clean
```

```
mvn package
```

```
mvn exec:java
```

Or you can run it all in one go :

```
mvn clean package exec:java
```

`exec:java` is what runs our project. 

If you get an output similar to this, then your code ran successfully🎉.

![final project output](./images/8_final_output.png)

The complete source code of the project is available on [GitHub](https://github.com/numerica-ideas/community/tree/master/java/maven-for-beginners)

———————

We have just started our journey to build a network of professionals to grow even more our free knowledge-sharing community that’ll give you a chance to learn interesting things about topics like cloud computing, software development, and software architectures while keeping the door open to more opportunities.

Does this speak to you? If **YES**, feel free to [Join our Discord Server](https://discord.numericaideas.com) to stay in touch with the community and be part of independently organized events.

———————


## Conclusion
In this article, we went over what Maven is about and saw some of its commands for compiling and packaging projects, etc. We also explained how to manage dependencies and plugins with Maven while working on a little fun project. If you went through the whole article, I hope you learned something new and are now confident to start using Maven in your own projects.

Thanks for reading this article. Like, recommend, and share if you enjoyed it. Follow us on [Facebook](https://www.facebook.com/numericaideas), [Twitter](https://twitter.com/numericaideas), and [LinkedIn](https://www.linkedin.com/company/numericaideas) for more content.