# Icinga-Dashing

Description
---
**en**: Dashing-Project to display your important services and hosts from icinga.
Requirements
---
- [Dashing](https://github.com/Shopify/dashing)
- [checkmk_livestatus](http://mathias-kettner.de/checkmk_livestatus.html)
- [My Dashingstate-gem](https://rubygems.org/gems/Dashingstate)

Usage
---
1. Install Dashing `gem install dashing`
2. Download and install checkmk_livestatus
3. Install Dashingstate gem with `gem install Dashingstate`
4. Create a new project with Dashing `dashing new PROJECT_NAME`
5. Download this project to the new project
6. Create a new job `dashing generate job NAME`
7. Look at the example.rb in jobdir
8. Create a new dashboard `dashing generate dashboard NAME`
9. Look at names.csv and range.csv in jobdir and fill these files with your services and hosts
10. start dashing `dashing start`

Other
---
Check out [Dashings Homepage](http://shopify.github.com/dashing) for more information.