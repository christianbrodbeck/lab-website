---
title: Team
nav:
  order: 3
  tooltip: About our team
---

# {% include icon.html icon="fa-solid fa-users" %}Team

{% include section.html %}

{% include list.html data="members" component="portrait" filter="role =~ /^pi$/ && group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role =~ /^postdoc$/ && group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role =~ /^(phd|msc|masc|meng)$/ && group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role =~ /^undergrad$/ && group != 'alum'" %}

{% include section.html %}

## Alumni

{% include list.html data="members" component="portrait" filter="group == 'alum'" %}

{% include section.html %}
