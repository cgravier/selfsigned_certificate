name             "selfsigned_certificate"
maintainer       "Christophe Gravier"
maintainer_email "christophe.gravier@univ-st-etienne.fr"
license          "All rights reserved"
description      "Creates/Installs/Configures a selfsigned certificate"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

%w{ ubuntu debian }.each do |os|
  supports os
end
