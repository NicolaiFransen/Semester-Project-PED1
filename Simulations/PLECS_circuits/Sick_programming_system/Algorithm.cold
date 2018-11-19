/**************************************************
 * MPPT ALGORITHM - INTRO760 - Fall 2018
 * This code implements a P&O algorithm to be used within a PLECS C-script.
 * The C script block has different execution codes (Code declaration, code execution
 * and update function code, among others) so the functions in this code are called
 * with the same names in order to know where to place every chunk.
 *
 * Things to do:
 * 1) Variables to tune:
 * -Decide C-script sample time. With different values the system has different behaviour
 * 	with the code from 3/11, 0.5 showed an acceptable tracking.
 * -delta duty cycle constant must be optimized
 * 2) in order to avoid noise, a threshold could be added to the power delta analysis
 * 3) The system startup logic must be optimized, to avoid big deltas
 * 4)...
 *
 */

code_declaration(){
	#define V_OC_threshold 43


	enum state {
		STARTUP,
		VOLTAGE_EVALUATION,
		VOLTAGE_INC,
		VOLTAGE_DEC,
		OPEN_LOOP,
	};

	double V, I, P, Vprevious, Iprevious, Pprevious, delta_V;
	double D_delta = 0.01;
	double D = 0;
	enum state SYSTEM_STATE = STARTUP;
	int startup_counter = 0;

	#define V_in Input(0);
	#define I_in Input(1);
	#define D_out Output(0);


	void Open_loop_decrease_D(void){
		D = D - D_delta;
	}

	void calculate_power(void){
		P = V * I;
	}

	void evaluate_voltage(void){
		delta_V = V - Vprevious;
	}

	void save_variables(void){
		Vprevious = V;
		Iprevious = I;
		Pprevious = P;
	}

	int power_is_increased(void){
		return P > Pprevious;
	}

	int power_is_decreased(void){
		return P < Pprevious;
	}
}


output_function_code(){
	/*****
	 * This code is NOT executed once per timestep. Check documentation for further info.
	 */
	Output(0) = D;
}

update_function_code(){
	V=V_in;
	I=I_in;

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

main(){
	FSM();
}

