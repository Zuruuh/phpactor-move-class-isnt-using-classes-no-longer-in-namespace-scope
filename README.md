Small reproducer for an issue I am having with phpactor. Basically, when moving a class using the `class:move` command,  
the classes that were used but not imported in the moved class (because they shared the same namespace) are not added to the use statements.

I've setup a small docker image to reproduce the issue, alongside with this repository. But in short:

We have two classes in the `Entity` repository. I want to move the class `UserRepository` to the `Repository` folder.  
The class `UserRepository` uses the class `User`, but does not explicitely import it since they are in the same namespace.  
When moving the `UserRepository` to its new namespace, I expect phpactor to add the required use statements if any are missing

```bash
./test.sh
/root/.composer/vendor/bin/phpactor --version
/root/.composer/vendor/bin/phpactor class:move src/Entity/UserRepository.php src/Repository/UserRepository.php
cat src/Repository/UserRepository.php
```
