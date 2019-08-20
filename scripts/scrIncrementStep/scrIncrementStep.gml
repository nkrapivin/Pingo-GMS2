with (oLevelManager)
{
	LevelPlayerSteps++;
	if (LevelPlayerSteps < LevelThreeStars) && (LevelPlayerSteps < LevelTwoStars)
	{
		LevelCanThreeStars = true;
		LevelCanTwoStars = false;
	}
	else if (LevelPlayerSteps > LevelThreeStars) && (LevelPlayerSteps < LevelTwoStars)
	{
		LevelCanThreeStars = false;
		LevelCanTwoStars = true;
	}
	else if (LevelPlayerSteps > LevelThreeStars) && (LevelPlayerSteps > LevelTwoStars)
	{
		LevelCanThreeStars = false;
		LevelCanTwoStars = false;
	}
}