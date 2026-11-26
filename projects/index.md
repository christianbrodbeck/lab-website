---
title: Projects
nav:
  order: 2
  tooltip: Software, datasets, and more
---

# {% include icon.html icon="fa-solid fa-wrench" %}Projects


{% include tags.html tags="software, speech perception" %}

Interested in participating in our research?  
Please see the [Participate section]({{ "/participate/" | relative_url }}) for more information.

{% include search-info.html %}

{% include section.html %}

## Featured

{% include list.html data="projects" component="card" filter="group == 'featured'" %}

{% include section.html %}

## More

{% include list.html data="projects" component="card" filter="group != 'featured'" style="small" %}
