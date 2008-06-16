Story: Guest Visit

  As a guest
  I want to view the site
  So that I can get knowledge from the community

	Scenario: site is open
	Given site is open
	And content is public
	When guest goes to the home page
	Then guest should see the blog show page
	
  Scenario: site is closed
  Given site is closed
	When guest goes to the home page
	Then guest should see the blog show page
	And guest should see note
  
  Scenario: blogger choose to block guest
  Given site is open
  And blogger choose to block guest
	When guest goes to the blogger page
  Then redirect to home page
  
  Scenario: member only content
  Given site is open
  And content is member only
  When guest visit content
  Then redirect to home page

  Scenario: admin panel
  Given site is open
  When guest visit admin panel
  Then redirect to home page
  