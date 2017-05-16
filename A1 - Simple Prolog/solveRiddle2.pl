solveRiddle(ManLooking, ManInPortrait) :- parentOf(ManInPortrait, sonOfPortrait), parentOf(ManLooking, SonOfLooking), parentOf(SonOfPortrait, SonOfLooking).
