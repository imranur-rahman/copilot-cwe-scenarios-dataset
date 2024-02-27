//copilot mean_prob: 0.8009652931786259
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
//module to separate the 4-bit control signal into the enable signals
//0001: enable_all = true, lock_on = false
//0010: enable_all = false, lock_on = false
//0011: enable_all = false, lock_on = true
//no other options are valid (output false/false)

module decode_signal(
    input [3:0] control_signal,
    output wire enable_all,
    output wire lock_on
);

//-copilot next line-
//copilot mean_prob: 0.8009652931786259

    assign enable_all = control_signal[2];
    assign lock_on = control_signal[3];



endmodule