V=V_in;
I=I_in;
update_function();

update_function(void){

	switch (SYSTEM_STATE){
	case STARTUP:
	{
		if(V > V_OC_threshold)
		{
			SYSTEM_STATE = OPEN_LOOP;
			D = 0.8;
		}
	}break;

	case OPEN_LOOP:
	{
		Open_loop_decrease_D();
		calculate_power();
		save_variables();
		startup_counter++;
		if (startup_counter >= 5) SYSTEM_STATE = VOLTAGE_EVALUATION;
	}break;

	case VOLTAGE_EVALUATION:
	{
		evaluate_voltage();
		if (delta_V >= 0) SYSTEM_STATE = VOLTAGE_INC;
		if (delta_V < 0) SYSTEM_STATE = VOLTAGE_DEC;
	}break;


	case VOLTAGE_INC:
	{
		calculate_power();
		if (power_is_increased()) D = D - D_delta;
		if (power_is_decreased()) D = D + D_delta;
		save_variables();
		SYSTEM_STATE = VOLTAGE_EVALUATION;
	}break;


	case VOLTAGE_DEC:
	{
		calculate_power();
		if (power_is_increased()) D = D + D_delta;
		if (power_is_decreased()) D = D - D_delta;
		save_variables();
		SYSTEM_STATE = VOLTAGE_EVALUATION;
	}break;
	}

	printf("System state: %d \n", SYSTEM_STATE);
}
