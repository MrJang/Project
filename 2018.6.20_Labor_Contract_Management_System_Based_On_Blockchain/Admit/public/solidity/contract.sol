pragma solidity ^0.4.11;

contract EmploymentContract{
    string public employee_name;
    bytes32 public employee_id_sha3_256;
    string public employer_name;
    bytes32 public employer_id_sha3_256;
    string public begin_labor_date;
    string public end_labor_date;
    string public start_labor_time;
    string public finish_labor_time;
    string public working_hours_per_day;
    string public working_days_per_week;
    string public day_off;
    string public wage_type;
    string public wage;
    string public bonus_system;
    string public other_wage_system;
    string public pay_day_monthly;
    string public pay_day_weekly;
    string public pay_method;
    string public insurance;
    string public contract_date;
    string public company_name;
    string public company_address;
    string public employee_address;
    string public employee_contact;
    uint8 private setted_num = 0;
    address public addr = address(this);

    function set_employee_name(string _employee_name){
        if(setted_num < 24){
            employee_name = _employee_name;
            setted_num++;
        }
    }
    function set_employee_id_sha3_256(bytes32 _employee_id_sha3_256){
        if(setted_num < 24){
            employee_id_sha3_256 = _employee_id_sha3_256;
            setted_num++;
        }
    }
    function set_employer_name(string _employer_name){
         if(setted_num < 24){
             employer_name = _employer_name;
             setted_num++;
         }
    }
    function set_employer_id_sha3_256(bytes32 _employer_id_sha3_256){
         if(setted_num < 24){
             employer_id_sha3_256 = _employer_id_sha3_256;
         }
         setted_num++;
    }
    function set_begin_labor_date(string _begin_labor_date){
         if(setted_num < 24){
             begin_labor_date = _begin_labor_date;
             setted_num++;
         }
    }
    function set_end_labor_date(string _end_labor_date){
        if(setted_num < 24){
            end_labor_date = _end_labor_date;
            setted_num++;
        }
    }
    function set_start_labor_time(string _start_labor_time){
        if(setted_num < 24){
            start_labor_time = _start_labor_time;
            setted_num++;
        }
    }
    function set_finish_labor_time(string _finish_labor_time){
        if(setted_num < 24){
            finish_labor_time = _finish_labor_time;
            setted_num++;
        }
    }
    function set_working_hours_per_day(string _working_hours_per_day){
        if(setted_num < 24){
            working_hours_per_day = _working_hours_per_day;
            setted_num++;
        }
    }
    function set_working_days_per_week(string _working_days_per_week){
        if(setted_num < 24){
            working_days_per_week = _working_days_per_week;
            setted_num++;
        }
    }
    function set_day_off(string _day_off){
        if(setted_num < 24){
            day_off = _day_off;
            setted_num++;
        }
    }
    function set_wage_type(string _wage_type){
         if(setted_num < 24){
             wage_type = _wage_type;
             setted_num++;
         }
    }
    function set_wage(string _wage){
        if(setted_num < 24){
            wage = _wage;
            setted_num++;
        }
    }
    function set_bonus_system(string _bonus_system){
        if(setted_num < 24){
            bonus_system = _bonus_system;
            setted_num++;
        }
    }
    function set_other_wage_system(string _other_wage_system){
        if(setted_num < 24){
            other_wage_system = _other_wage_system;
            setted_num++;
        }
    }
    function set_pay_day_monthly(string _pay_day_monthly){
        if(setted_num < 24){
            pay_day_monthly = _pay_day_monthly;
        }
        setted_num++;
    }
    function set_pay_day_weekly(string _pay_day_weekly){
        if(setted_num < 24){
            pay_day_weekly = _pay_day_weekly;
            setted_num++;
        }
    }
    function set_pay_method(string _pay_method){
        if(setted_num < 24){
            pay_method = _pay_method;
            setted_num++;
        }
    }
    function set_insurance(string _insurance){
        if(setted_num < 24){
            insurance = _insurance;
            setted_num++;
        }
    }
    function set_contract_date(string _contract_date){
         if(setted_num < 24){
             contract_date = _contract_date;
             setted_num++;
         }
    }
    function set_company_name(string _company_name){
        if(setted_num < 24){
            company_name = _company_name;
            setted_num++;
        }
    }
    function set_company_address(string _company_address){
        if(setted_num < 24){
            company_address = _company_address;
            setted_num++;
        }
    }
    function set_employee_address(string _employee_address){
        if(setted_num < 24){
            employee_address = _employee_address;
            setted_num++;
        }
    }
    function set_employee_contact(string _employee_contact){
        if(setted_num < 24){
            employee_contact = _employee_contact;
            setted_num++;
        }
    }
}