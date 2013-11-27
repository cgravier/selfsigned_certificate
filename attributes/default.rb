#
# Author:: Christophe Gravier (<christophe.gravier@telecom-st-etienne.fr>)
# Cookbook Name:: selfsigned_certificate
# Attributes:: default
#
# Copyright 2013, Universite Jean Monnet
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# all attributes, except destination MUST be overriden. They are set to dummy values here but the exhaustive list is here.

default['selfsigned_certificate']['destination'] = "/usr/var/ssl/certs/"
default['selfsigned_certificate']['sslpassphrase'] = "changeme"
default['selfsigned_certificate']['country'] = "CO"
default['selfsigned_certificate']['state'] = "ST"
default['selfsigned_certificate']['city'] = "CI"
default['selfsigned_certificate']['orga'] = "OR"
default['selfsigned_certificate']['depart'] = "DE"
default['selfsigned_certificate']['cn'] = "CN"
default['selfsigned_certificate']['email'] = "EMAIL"
