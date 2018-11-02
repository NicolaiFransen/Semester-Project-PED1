#define D_min 0.2 //TBD

enum state {
	STARTUP = 0,
	VOLTAGE_EVALUATION = 1,
	VOLTAGE_INC = 2,
	VOLTAGE_DEC = 3,
};

double V, I, P, Vprevious, Iprevious, Pprevious, delta_V;
double D_delta = 0.01;
double D = D_min;
enum state SYSTEM_STATE = STARTUP;
int startup_counter = 0;



FSM(){
	switch (SYSTEM_STATE){
		case STARTUP:
		{
			Open_loop_increase_D();
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
}


Open_loop_increase_D(void){
	D = D + D_delta;
}

calculate_power(void){
	P = V * I;
}

evaluate_voltage(void){
	delta_V = V - Vprevious;
}

save_variables(void){
	Vprevious = V;
	Iprevious = I;
	Pprevious = P;
}

power_is_increased(void){
	return P > Pprevious;
}

power_is_decreased(void){
	return P < Pprevious;
}

main(){
	FSM();
}

