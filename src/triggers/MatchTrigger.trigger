trigger MatchTrigger on Match__c (after insert) {
	
	list<Match__c> newMatches = trigger.new;
	list<Event_Option__c> newEventOptions = new List<Event_Option__c>();
	
	 
	for(Match__c match: newMatches){
		
		if(match.type__c == 'football') {
			Event_Option__c eoResult = new Event_Option__c(Match__c = match.id,
													 Name = 'result',
													 Available_Points__c = 2);
			newEventOptions.add(eoResult);
		    Event_Option__c eoHScore = new Event_Option__c(Match__c = match.id,
				 									 Name = 'homescore',
													 Available_Points__c = 2);
			newEventOptions.add(eoHScore);										 
		 	Event_Option__c eoAScore = new Event_Option__c(Match__c = match.id,
													 Name = 'awayscore',
													 Available_Points__c = 2);
			newEventOptions.add(eoAScore);	
		}
		
	}
	
	insert newEventOptions; 
}