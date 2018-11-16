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


#define V_OC_threshold 43


	enum state {
		STARTUP,
		VOLTAGE_EVALUATION,
		VOLTAGE_INC,
		VOLTAGE_DEC,
		OPEN_LOOP,
	};

	double V, I, P, Vprevious, Iprevious, Pprevious, delta_V;
	static double D_delta = 0.01;
	static double D = 0;
	static enum state SYSTEM_STATE = STARTUP;
	static int startup_counter = 0;

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
