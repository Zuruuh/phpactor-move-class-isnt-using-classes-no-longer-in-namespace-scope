Small reproducer for an issue I am having with phpactor. Basically, when moving a class using the `class:move` command,  
the classes that were used but not imported in the moved class (because they shared the same namespace) are not added to the use statements.

I've setup a small docker image to reproduce the issue, alongside with this repository.

```bash
./test.sh
/root/.composer/vendor/bin/phpactor --version
/root/.composer/vendor/bin/phpactor class:move src/Entity/UserRepository.php src/Repository/UserRepository.php
cat src/Repository/UserRepository.php
```
