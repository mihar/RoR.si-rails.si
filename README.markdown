# Ruby on Rails Slovenija
## Community site rails app

This is the source code for the Slovenian Ruby/Rails Community website, [rails.si](http://rails.si). 
It was built on top of the great [boston.rb's site](/bostonrb/bostonrb).

It is licensed under the MIT License, so if you would like to fork and customize for your own user group, you are more than welcome to.

## Authors and contributors

[Srđan Prodanović](/Artiqulate) and [Miha Rebernik](/mihar)

Design by Srđan Prodanović

## Dependencies

We're using our own modified le-git gem, that has to be installed locally.
Before you attempt the installation, please uninstall any of the following gems, if present:
<pre>
  sudo gem uninstall dancroak-le-git
  sudo gem uninstall technicalpickles-le-git
</pre>
Clone the repo from my [github page](/mihar/le-git) and run:
<pre>
  git clone git://github.com/mihar/le-git.git
  cd le-git
  rake build
  sudo gem install pkg/le-git-0.2.0.gem
</pre>