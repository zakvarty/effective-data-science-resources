# Week 5 Live Session - Codes of Conduct

## Session Outline 

### Questions on the assessment(s)

Time to answer any questions that were too detailed to give a written response or to reiterate important questions that were asked throguh the week. 

This year's topics included: 

- Do I need to test my code? 
- How to prepare pdf document
  - Scripting and LaTeX vs Quarto vs Rmd vs JuPyteR
  - Can I use Tableau / Canva / Photoshop / Other to make the infographic? 
- Uploading large (data) files 

Notable follow-ups 

- How strict it is on how we have to follow the Economist style guidelines?
- Are we allowed to format infographics in landscape or do they have to be portrait?
- The Economist style guide gives some different instructions for print vs web visualisations. Are we supposed to use the print ones?

### Review of topics

- __Privacy__
    - Human and legal right (GDPR)
    - $k$-anonymity
    - Netflix De-anonymisation

- __Fairness__
    - Most at risk: minorities & historically disadvantaged groups
    - Fairness metrics & loss function
    - Gender Shades case study

- __Codes of Conduct__
    - Tools for supporting good work
    - _Highly_ variable in detail
    - Explore more in this session.


### Discussion of professional guidelines 

Lots of ways to dice up the same ideas: 

__Floridi and Cowls:__ Beneficence, Non-maleficence, Autonomy, Justice, Explicability.

__Turing Institute:__ Fairness, Accountability, Sustainability, Saftey, Transparency.


Consider ethical guidelines of several organisations and how the map onto Floridi and Cowls. 

- Group 1 [The European Union](https://op.europa.eu/s/sUPP)
- Group 2 [The Royal Statistical Society](https://rss.org.uk/RSS/media/News-and-publications/Publications/Reports%20and%20guides/A-Guide-for-Ethical-Data-Science-Final-Oct-2019.pdf)
- Group 3 [The Dutch Government](https://www.government.nl/documents/reports/2021/07/31/impact-assessment-fundamental-rights-and-algorithms)
- Group 4 [The UK Government](https://www.gov.uk/guidance/understanding-artificial-intelligence-ethics-and-safety)
- Group 5 (Online) [Google](https://ai.google/responsibility/principles/)

Questions to answer in groups:

- Who is the intended audience for your document?
- How do the published guidelines link to the guidelines of Floridi and Cowls?
- How effectively does the document achieve its goal?
- What would you change or do differently?

Use `assets/professional-guidelines-sheet.pdf` to make notes during discussions. 

### Thought experiments / case studies 

- Recommender systems and pregnancy products
- Doorbell cameras and online banking
- Data scraping journalist request

### Optional: K-anonymisation walk-through 

First demonstrate difference between $k$-anonymising with respect to a single outcome or a table as a whole. Emphasise $k$ as the size of the smallest equivalence class. 

ChatGPT failed to generate $k$-anonymised data. Can you fix it to be 3-anonymous? 

Lead group in discussion on various approaches: 

- coarsening, 
- redaction, 
- problems with continuous variables, 
- adapting methods to suit how the data will be used,
- only being able to publish one version.

Supporting file: `assets/k-anonymity-examples.xlsx`