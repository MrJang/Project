var Web3 = require("web3"); //web3 모듈을 전역으로 사용. (이더리움 api)
web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));  //remix에서 사용하는 주소로,이더리움 노드와 의 연결을 지정함.
var express = require("express"); //express 모듈을 전역 접근으로 사용. (web 프로그래밍 프레임 워크)
var EtherNode = express(); 		  //express 함수를 EtherNode 변수에 담아서 사용.
var server = require("http").createServer(EtherNode); //http모듈을 전역으로 접근하여 사용 하는데, express 모듈을 인자로 하여, 서버 생성.
var io = require("socket.io")(server); 				  //socket.io모듈을 전역으로 접근하여 사용하는데, 이 소켓을 이용하여,위의 서버쪽 통신을 구현.
EtherNode.use(express.static(__dirname+'/views/'));

server.listen(8500);								  //8500포트로 바인드하여, 리슨 상태로 접어듬.

var mysql=require("mysql");
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
var xmlhttp = new XMLHttpRequest();

dbconn = mysql.createConnection({
    host    :"localhost",
    port : 3306,
    user : "root",
    password : "admit",
    database:"admit_db"
});

var bodyParser = require("body-parser");
EtherNode.use(bodyParser.urlencoded({
	extended: false
}));
EtherNode.use(bodyParser.json({ type: 'application/json' }));

EtherNode.get("/",function(request,response){

	response.sendFile("index.html"); //웹페이지를 리턴.
	
});
//0.로그인
EtherNode.post("/login/",function(request,response){
//Stringify문 없애고.
	var user_id =request.body.user_id;
	var user_pwd=request.body.user_pwd;
	console.log(user_id);
	console.log(user_pwd);
	if(request.body.type == "employee"){
		var type="employee";
		dbconn.query("select * from employee where employee_id=? and employee_pwd=?",[user_id,user_pwd],function(error,result){
			if(error){
				console.log(error);
				var user_info={"login_state" : "N"};
				var user_info_employee=JSON.stringify(user_info);
				response.setHeader("Content-Type", "application/json");
				response.json(user_info_employee);
				
				
			}else{

				var user_name=result[0].employee_name;
				var user_num=result[0].employee_num+"";
				var user_info={"employee_num" : user_num , "employee_id" : user_id, "employee_name" : user_name,"type" : type,"login_state" : "Y"};
				response.setHeader("Content-Type", "application/json");
				response.json(user_info);
		
			}
		});
	}else{
		var type="employer";
		dbconn.query("select * from employer where employer_id=? and employer_pwd=?",[user_id,user_pwd],function(error,result){
			if(error){
				console.log(error);
				var user_info={"login_state" : "N"};
				response.setHeader("Content-Type", "application/json");
				response.json(user_info);
				
			}else{
				var user_name=result[0].employer_name;
				var user_num=result[0].employer_num+"";
				var user_info={"employer_num" : user_num , "employer_id" : user_id, "employer_name" : user_name,"type" : type,"login_state" : "Y"};
				response.setHeader("Content-Type", "application/json");
				response.json(user_info);
				
			}
		});
	}

})
//1. 고용주 작성후
EtherNode.post("/fillhalf/",function(request,response){
	console.log(request.body.employer_num);
	console.log(request.body.employer_name);
	var employer_num = parseInt(request.body.employer_num);
	var employer_name = request.body.employer_name;
	var begin_labor_date = request.body.begin_labor_date;
	var end_labor_date = request.body.end_labor_date;
	var start_labor_time = request.body.start_labor_time;
	var end_labor_time = request.body.end_labor_time;
	var working_hours_per_day = request.body.working_hours_per_day;
	var working_hours_per_week = request.body.working_hours_per_week;
	var day_off = request.body.day_off;
	var wage_type = request.body.wage_type;
	var wage= request.body.wage;
	var bonus_system = request.body.bonus_system;
	var other_wage_system = request.body.other_wage_system;
	var pay_day_monthly = request.body.pay_day_monthly;
	var pay_day_weekly = request.body.pay_day_weekly;
	var pay_method = request.body.pay_method;
	var insurance = request.body.insurance;
	var company_name = request.body.company_name;
	var company_address = request.body.company_address;
      
	var contract_num;
	
	dbconn.query("insert into temp_contract (employer_num,employer_name,begin_labor_date,end_labor_date,start_labor_time,end_labor_time,working_hours_per_day,working_hours_per_week,day_off,wage_type,wage,bonus_system,other_wage_system,pay_day_monthly,pay_day_weekly,pay_method,insurance,company_name,company_address) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[employer_num,employer_name,begin_labor_date,end_labor_date,start_labor_time,end_labor_time,working_hours_per_day,working_hours_per_week,day_off,wage_type,wage,bonus_system,other_wage_system,pay_day_monthly,pay_day_weekly,pay_method,insurance,company_name,company_address],function(error,result){
		if(error){
			console.log(error);
		}else{
		    console.log("고용주가 계약서를 작성하였습니다.");
		    dbconn.query("select contract_num from temp_contract where employer_num = ?",[employer_num],function(error,result){
		    	if(error){
		    		console.log(error);
		    	}else{
		    		console.log("유효한 계약서 입니다.");
		    		contract_num=result[0].contract_num;
		    		var contract_num_info={"contract_num" : contract_num};
		    		response.setHeader("Content-Type", "application/json");
		    		response.json(contract_num_info);
		    		//고용주에게 데이터 전송(계약서 번호를 알려주라고.)
		    		}	
		    	});
		   }
		 });
	
	});
	
//2. 사원이 계약서번호를 알고, search 함.
EtherNode.post("/searchhalf/",function(request,response){
	var contract_num=parseInt(request.body.contract_num);
	var employer_name=request.body.employer_name;
	var employer_num;
	var employer_name;
	var begin_labor_date;
	var end_labor_date;
	var start_labor_time;
	var end_labor_time;
	var working_hours_per_day;
	var working_hours_per_week;
	var day_off;
	var wage_type;
	var wage;
	var bonus_system;
	var other_wage_system;
	var pay_day_monthly;
	var pay_day_weekly;
	var pay_method;
	var insurance;
	var company_name;
	var company_address;    
	
	dbconn.query("select * from temp_contract where contract_num=? & employer_name=?",[contract_num,employer_name],function(error,result){
		if(error){
			console.log(error);
		}else{
			console.log("계약서 검색이 완료 되었습니다.");
			
			employer_num=parseInt(result[0].employer_num);
			employer_name=result[0].employer_name;
			begin_labor_date=result[0].begin_labor_date;
			end_labor_date=result[0].end_labor_date;
			start_labor_time=result[0].start_labor_time;
			end_labor_time=result[0].end_labor_time;
			working_hours_per_day=result[0].working_hours_per_day;
			working_hours_per_week=result[0].working_hours_per_week;
			day_off=result[0].day_off;
			wage_type=result[0].wage_type;
			wage=result[0].wage;
			bonus_system=result[0].bonus_system;
			other_wage_system=result[0].other_wage_system;
			pay_day_monthly=result[0].pay_day_monthly;
			pay_day_weekly=result[0].pay_day_weekly;
			pay_method=result[0].pay_method;
			insurance=result[0].insurance;
			company_name=result[0].company_name;
			company_address=result[0].company_address;
			
			var contract_half_info={"contract_num" : contract_num,"employer_num" : employer_num,"employer_name" : employer_name ,"begin_labor_date" : begin_labor_date,"end_labor_date" : end_labor_date,"start_labor_time" : start_labor_time,"end_labor_time" : end_labor_time,"working_hours_per_day" : working_hours_per_day,"working_hours_per_week" : working_hours_per_week,"day_off" : day_off,"wage_type" : wage_type,"wage" : wage,"bonus_system" : bonus_system,"other_wage_system" : other_wage_system,"pay_day_monthly" : pay_day_monthly,"pay_day_weekly" : pay_day_weekly,"pay_method" : pay_method,"insurance" : insurance,"company_name" : company_name,"company_address" : company_address};
			response.setHeader("Content-Type", "application/json");
    		response.json(contract_half_info);
    		//사원에게 다시 보냄.
		}
	});
});
//3, 사원이 작성 후 
EtherNode.post("/fillcomplete/",function(request,response){
	
	var contract_num=parseInt(request.body.contract_num);
	var employee_num=parseInt(request.body.employee_num);
	var employee_name=request.body.employee_name;
	var contract_date=request.body.contract_date;
	var employee_address=request.body.employee_address;
	var employee_contact=request.body.employee_contact;
	console.log(contract_num+","+employee_num+","+employee_name+","+contract_date+","+employee_address+","+employee_contact);
	dbconn.query("update temp_contract set employee_num=?,employee_name=?,contract_date=?,employee_address=?,employee_contact=? where contract_num=?",[employee_num,employee_name,contract_date,employee_address,employee_contact,contract_num],function(error,result){
		if(error){
			console.log(error);
		}else{
			dbconn.query("select * from temp_contract where contract_num =?",[contract_num],function(error,result){
			if(error){
				console.log(error);
			}else{
				console.log("동의 단계가 임박했습니다.");
				var contract_almost_info={"contract_almost_info":"Y"};
				response.json(contract_almost_info);
			}
				
			});
		}
	});
});
//4. 공통으로 완전히 기입된 정보를 봄.
EtherNode.post("/searchcomplete/",function(request,response){
	var contract_num=parseInt(request.body.contract_num);
	var employer_name=request.body.employer_name;
	var employee_num; 
	var employer_num; 
	var employee_name;
	var employer_name;
	var begin_labor_date; 
	var end_labor_date;
	var start_labor_time; 
	var end_labor_time; 
	var working_hours_per_day;
	var working_hours_per_week; 
	var day_off; 
	var wage_type; 
	var wage; 
	var bonus_system; 
	var other_wage_system;
	var pay_day_monthly;
	var pay_day_weekly;
	var pay_method; 
	var insurance; 
	var contract_date; 
	var company_name; 
	var company_address; 
	var employee_address; 
	var employee_contact;                
	var employee_confirm;               
	var employer_confirm; 
	
	dbconn.query("select * from temp_contract where contract_num=? & employer_name=?",[contract_num,employer_name],function(error,result){
		if(error){
			console.log(error);
		}else{
			employee_num=result[0].employee_num; 
			employer_num=result[0].employer_num; 
			employee_name=result[0].employee_name;
			employer_name=result[0].employer_name;
			begin_labor_date=result[0].begin_labor_date; 
			end_labor_date=result[0].end_labor_date;
			start_labor_time=result[0].start_labor_time; 
			end_labor_time=result[0].end_labor_time; 
			working_hours_per_day=result[0].working_hours_per_day;
			working_hours_per_week=result[0].working_hours_per_week; 
			day_off=result[0].day_off; 
			wage_type=result[0].wage_type; 
			wage=result[0].wage; 
			bonus_system=result[0].bonus_system; 
			other_wage_system=result[0].other_wage_system;
			pay_day_monthly=result[0].pay_day_monthly;
			pay_day_weekly=result[0].pay_day_weekly;
			pay_method=result[0].pay_method; 
			insurance=result[0].insurance; 
			contract_date=result[0].contract_date; 
			company_name=result[0].company_name; 
			company_address=result[0].company_address; 
			employee_address=result[0].employee_address; 
			employee_contact=result[0].employee_contact;                
			employee_confirm=result[0].employee_confirm;               
			employer_confirm=result[0].employer_confirm; 
			
			var contract_info_almost={"employee_num" : employee_num,"employer_num" : employer_num,"employee_name" : employee_name ,"employer_name" : employer_name,"begin_labor_date" : begin_labor_date,"end_labor_date" : end_labor_date,"start_labor_time" : start_labor_time,"end_labor_time" : end_labor_time,"working_hours_per_day" : working_hours_per_day,"working_hours_per_week" : working_hours_per_week,"day_off" : day_off,"wage_type" : wage_type,"wage" : wage,"bonus_system" : bonus_system,"other_wage_system" : other_wage_system,"pay_day_monthly" : pay_day_monthly,"pay_day_weekly" : pay_day_weekly,"pay_method" : pay_method,"insurance" : insurance,"contract_date" : contract_date,"company_name" : company_name,"company_address" : company_address,"employee_address" : employee_address,"employee_contact" : employee_contact,"employee_confirm" : employee_confirm,"employer_confirm" : employer_confirm};
			response.setHeader("Content-Type", "application/json");
    		response.json(contract_info_almost);
    		//양측 모두 정보를 보낼수 있음.
		}
	});
});
//5.고용주가 confirm 했을 때 
	EtherNode.post("/employerconfirm/",function(request,response){

	var contract_num=parseInt(request.body.contract_num);
	var employer_confirm=request.body.employer_confirm;// 앱으로 부터 고용주의 Y,N을 받아옴.
	
	dbconn.query("update temp_contract set employer_confirm=? where contract_num=?",[employer_confirm,contract_num],function(error,result){
		if(error){
			console.log(error);
		}else{
			console.log("고용주가 계약서 승인/반려를 선택 했습니다.");
			var contract_employer_confirm_info={"contract_employer_confirm_info" : "Y"};
			response.setHeader("Content-Type", "application/json");
			response.json(contract_employer_confirm_info);
		}
	});
	
});	
//6. 사원이 confirm 했을 때((실제로 블록 생성하면서 계약 하기 까지))
EtherNode.post("/employeeconfirm/",function(request,response){
	
	var contract_num=parseInt(request.body.contract_num);
	var employee_confirm=request.body.employee_confirm;//앱으로 부터 사원의 Y,N을 받아옴.
	var employee_confirm_info;
	var employer_confirm_info;
	var employee_num;
	var employer_num;
	//------------------------이더리움으로 넘길 정보들--------------------
	var employee_id;
	var employer_id;
	var employee_name;
	var employer_name;
	var begin_labor_date; 
	var end_labor_date;
	var start_labor_time; 
	var end_labor_time; 
	var working_hours_per_day;
	var working_hours_per_week; 
	var day_off; 
	var wage_type; 
	var wage; 
	var bonus_system; 
	var other_wage_system;
	var pay_day_monthly;
	var pay_day_weekly;
	var pay_method; 
	var insurance; 
	var contract_date; 
	var company_name; 
	var company_address; 
	var employee_address; 
	var employee_contact;
	
	dbconn.query("update temp_contract set employee_confirm=? where contract_num=?",[employee_confirm,contract_num],function(error,result){
		if(error){
			console.log(error);
		}else{
			console.log("사원이 계약서 승인/반려를 선택 했습니다.");
			dbconn.query("select * from temp_contract where contract_num=?",[contract_num],function(error,result){
				employee_confirm=result[0].employee_confirm;
				employer_confirm=result[0].employer_confirm;
				employee_num=result[0].employee_num;
				employer_num=result[0].employer_num;
				//////////////////////!!집중!!/////////////////
				if(employee_confirm =="Y" && employer_confirm=="Y"){// 조금 생각해보자.
					dbconn.query("select employee_id,employee_name from employee where employee_num=?",[employee_num],function(error,result){
						if(error){
							console.log(error);
						}else{
							employee_id=result[0].employee_id;
							
						}
					});
					dbconn.query("select employer_id,employer_name from employer where employer_num=?",[employer_num],function(error,result){
						if(error){
							console.log(error);
						}else{
							employer_id=result[0].employer_id;
							
						}
					});
					dbconn.query("select * from temp_contract where contract_num=?",[contract_num],function(error,result){
						if(error){
							console.log(error);
						}else{
							employee_name=result[0].employee_name;
							employer_name=result[0].employer_name;
							begin_labor_date=result[0].begin_labor_date; 
							end_labor_date=result[0].end_labor_date;
							start_labor_time=result[0].start_labor_time; 
							end_labor_time=result[0].end_labor_time; 
							working_hours_per_day=result[0].working_hours_per_day+"";
							working_hours_per_week=result[0].working_hours_per_week+""; 
							day_off=result[0].day_off; 
							wage_type=result[0].wage_type; 
							wage=result[0].wage+""; 
							bonus_system=result[0].bonus_system; 
							other_wage_system=result[0].other_wage_system;
							pay_day_monthly=result[0].pay_day_monthly+"";
							pay_day_weekly=result[0].pay_day_weekly;
							pay_method=result[0].pay_method; 
							insurance=result[0].insurance; 
							contract_date=result[0].contract_date; 
							company_name=result[0].company_name; 
							company_address=result[0].company_address; 
							employee_address=result[0].employee_address; 
							employee_contact=result[0].employee_contact;
							
						}
						 var contract_creation_info={"contract_creation_info":"Y"};
						 response.json(contract_creation_info);
						 web3.personal.unlockAccount(web3.eth.accounts[0],"8859");
						   
						 createContract(employee_name,employee_id,employer_name,employer_id,begin_labor_date,end_labor_date,start_labor_time,end_labor_time,working_hours_per_day,working_hours_per_week,day_off,wage_type,wage,bonus_system,other_wage_system,pay_day_monthly,pay_day_weekly,pay_method,insurance,contract_date,company_name,company_address,employee_address,employee_contact,employee_num,employer_num,contract_num);
						
					});
					
				   
				}else{
					console.log("계약이 무산되었습니다.");
					var contract_complete_info={"contract_complete_info" : "N"};
					response.setHeader("Content-Type", "application/json");
					response.json(contract_complete_info);
				}
			});
		}
	});
});

EtherNode.post("/searchcontract/",function(request,response){
	var type=request.body.type;
	var employee_num;
	var employer_num;
	var contract_address;
	var contract_info_obj;
//------------------------
	
	if(type=="employee"){
		employee_num=parseInt(request.body.employee_num);
		dbconn.query('select contract_address from contract_info where employee_num=?',[employee_num],function(error,result){
			if(error){
				console.log(error);
			}else{
				contract_address=result[0].contract_address;
				contract_info_obj=JSON.parse(getContractContent(contract_address));
			
				var employee_name=contract_info_obj.employee_name;
				var employer_name=contract_info_obj.employer_name;
				var begin_labor_date=contract_info_obj.end_labor_date;
				var end_labor_date=contract_info_obj.end_labor_date;
				var start_labor_time=contract_info_obj.start_labor_time;
				var end_labor_time=contract_info_obj.finish_labor_time;
				var working_hours_per_day=contract_info_obj.working_hours_per_day;
				var working_hours_per_week=contract_info_obj.working_days_per_week;
				var day_off=contract_info_obj.day_off;
				var wage_type=contract_info_obj.wage_type;
				var wage=contract_info_obj.wage;
				var bonus_system=contract_info_obj.bonus_system;
				var other_wage_system=contract_info_obj.other_wage_system;
				var pay_day_monthly=contract_info_obj.pay_day_monthly;
				var pay_day_weekly=contract_info_obj.pay_day_weekly;
				var pay_method=contract_info_obj.pay_method;
				var insurance=contract_info_obj.insurance;
				var contract_date=contract_info_obj.contract_date;
				var company_name=contract_info_obj.company_name;
				var company_address=contract_info_obj.company_address;
				var employee_address=contract_info_obj.employee_address;
				var employee_contact=contract_info_obj.employee_contact;
				var contract_info={"employee_name":employee_name,"employer_name":employer_name,"begin_labor_date":begin_labor_date,"end_labor_date":end_labor_date,"start_labor_time":start_labor_time,"end_labor_time":end_labor_time,"working_hours_per_day":working_hours_per_day,"working_hours_per_week":working_hours_per_week,"day_off":day_off,"wage_type":wage_type,"wage":wage,"bonus_system":bonus_system,"other_wage_system":other_wage_system,"pay_day_monthly":pay_day_monthly,"pay_day_weekly":pay_day_weekly,"pay_method":pay_method,"insurance":insurance,"contract_date":contract_date,"company_name":company_name,"company_address":company_address,"employee_address":employee_address,"employee_contact":employee_contact}
	    		response.setHeader("Content-Type", "application/json");
	    		response.json(contract_info);
			}
		});
	}else{
		employer_num=parseInt(request.body.employer_num);
		dbconn.query('select contract_address from contract_info where employer_num=?',[employer_num],function(error,result){
			if(error){
				console.log(error);
			}else{
				contract_address=result[0].contract_address;
				contract_info_obj=JSON.parse(getContractContent(contract_address));
				
				var employee_name=contract_info_obj.employee_name;
				var employer_name=contract_info_obj.employer_name;
				var begin_labor_date=contract_info_obj.end_labor_date;
				var end_labor_date=contract_info_obj.end_labor_date;
				var start_labor_time=contract_info_obj.start_labor_time;
				var end_labor_time=contract_info_obj.finish_labor_time;
				var working_hours_per_day=contract_info_obj.working_hours_per_day;
				var working_hours_per_week=contract_info_obj.working_days_per_week;
				var day_off=contract_info_obj.day_off;
				var wage_type=contract_info_obj.wage_type;
				var wage=contract_info_obj.wage;
				var bonus_system=contract_info_obj.bonus_system;
				var other_wage_system=contract_info_obj.other_wage_system;
				var pay_day_monthly=contract_info_obj.pay_day_monthly;
				var pay_day_weekly=contract_info_obj.pay_day_weekly;
				var pay_method=contract_info_obj.pay_method;
				var insurance=contract_info_obj.insurance;
				var contract_date=contract_info_obj.contract_date;
				var company_name=contract_info_obj.company_name;
				var company_address=contract_info_obj.company_address;
				var employee_address=contract_info_obj.employee_address;
				var employee_contact=contract_info_obj.employee_contact;
				var contract_info={"employee_name":employee_name,"employer_name":employer_name,"begin_labor_date":begin_labor_date,"end_labor_date":end_labor_date,"start_labor_time":start_labor_time,"end_labor_time":end_labor_time,"working_hours_per_day":working_hours_per_day,"working_hours_per_week":working_hours_per_week,"day_off":day_off,"wage_type":wage_type,"wage":wage,"bonus_system":bonus_system,"other_wage_system":other_wage_system,"pay_day_monthly":pay_day_monthly,"pay_day_weekly":pay_day_weekly,"pay_method":pay_method,"insurance":insurance,"contract_date":contract_date,"company_name":company_name,"company_address":company_address,"employee_address":employee_address,"employee_contact":employee_contact}
	    		response.setHeader("Content-Type", "application/json");
	    		response.json(contract_info);
	    		
			}
		});
	}
	
	
});
function getContract(fn){
	var employmentcontractContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"_bonus_system","type":"string"}],"name":"set_bonus_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employer_name","type":"string"}],"name":"set_employer_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_address","type":"string"}],"name":"set_employee_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_contact","type":"string"}],"name":"set_employee_contact","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_insurance","type":"string"}],"name":"set_insurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"day_off","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_name","type":"string"}],"name":"set_employee_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_contract_date","type":"string"}],"name":"set_contract_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"end_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_start_labor_time","type":"string"}],"name":"set_start_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_weekly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_finish_labor_time","type":"string"}],"name":"set_finish_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_id_sha3_256","type":"bytes32"}],"name":"set_employee_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"working_hours_per_day","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"working_days_per_week","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"start_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_monthly","type":"string"}],"name":"set_pay_day_monthly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_day_off","type":"string"}],"name":"set_day_off","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage_type","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage_type","type":"string"}],"name":"set_wage_type","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_working_days_per_week","type":"string"}],"name":"set_working_days_per_week","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"finish_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_end_labor_date","type":"string"}],"name":"set_end_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"addr","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_monthly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_working_hours_per_day","type":"string"}],"name":"set_working_hours_per_day","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"insurance","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_contact","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"bonus_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employer_id_sha3_256","type":"bytes32"}],"name":"set_employer_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_method","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_weekly","type":"string"}],"name":"set_pay_day_weekly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_other_wage_system","type":"string"}],"name":"set_other_wage_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_company_name","type":"string"}],"name":"set_company_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"begin_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"other_wage_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_company_address","type":"string"}],"name":"set_company_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"contract_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage","type":"string"}],"name":"set_wage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_begin_labor_date","type":"string"}],"name":"set_begin_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_pay_method","type":"string"}],"name":"set_pay_method","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]);
	var employmentcontract = employmentcontractContract.new(
	   {
	     from: web3.eth.accounts[0], 
	     data: '0x60806040526000601860006101000a81548160ff021916908360ff16021790555030601860016101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555034801561006d57600080fd5b506131018061007d6000396000f300608060405260043610610250576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168062c2984d14610255578063080ac9cf146102be57806316c589ea1461032757806324061ecb1461039057806328c543b5146103c35780632955cbef1461042c5780632ad1acf0146104955780632b7335b3146105255780632f67c7bb146105b55780632f8c135a1461064557806334e81ead146106ae578063350c02641461071757806335a28eb3146107a757806335a944cc1461083757806336d4b042146108c7578063418b6f6714610930578063463f06a1146109c05780634897908314610a5057806348a7bccc14610ab957806349e315c514610aea5780634b2b412c14610b7a578063513e3b2114610c0a5780635766542b14610c9a5780635ec045cd14610d03578063627176d114610d6c5780636b1a077f14610dfc5780636e127af514610e655780636eb0d2d914610ece5780637426fcfc14610f5e578063767800de14610fc7578063768b886d1461101e5780637ba23f21146110ae578063860cf32c1461113e57806389cf3204146111a75780638eb4edbe14611237578063a6561d88146112c7578063af6797ea14611357578063b99b488c14611388578063c0d263de14611418578063c13296b614611481578063cf0064d9146114ea578063d166b77d14611553578063d34a02c7146115e3578063d9fa90fd14611673578063e020b8a3146116dc578063e8dd0c8a1461176c578063ed8f4e791461179f578063eda3ed0e14611808578063fd0bcbf514611871575b600080fd5b34801561026157600080fd5b506102bc600480360381019080803590602001908201803590602001908080601f01602080910402602001604051908101604052809392919081815260200183838082843782019150505050505091929192905050506118da565b005b3480156102ca57600080fd5b50610325600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611941565b005b34801561033357600080fd5b5061038e600480360381019080803590602001908201803590602001908080601f01602080910402602001604051908101604052809392919081815260200183838082843782019150505050505091929192905050506119a8565b005b34801561039c57600080fd5b506103a5611a0f565b60405180826000191660001916815260200191505060405180910390f35b3480156103cf57600080fd5b5061042a600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611a15565b005b34801561043857600080fd5b50610493600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611a7c565b005b3480156104a157600080fd5b506104aa611ae3565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156104ea5780820151818401526020810190506104cf565b50505050905090810190601f1680156105175780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561053157600080fd5b5061053a611b81565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561057a57808201518184015260208101905061055f565b50505050905090810190601f1680156105a75780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156105c157600080fd5b506105ca611c1f565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561060a5780820151818401526020810190506105ef565b50505050905090810190601f1680156106375780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561065157600080fd5b506106ac600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611cbd565b005b3480156106ba57600080fd5b50610715600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611d24565b005b34801561072357600080fd5b5061072c611d8b565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561076c578082015181840152602081019050610751565b50505050905090810190601f1680156107995780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156107b357600080fd5b506107bc611e29565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156107fc5780820151818401526020810190506107e1565b50505050905090810190601f1680156108295780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561084357600080fd5b5061084c611ec7565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561088c578082015181840152602081019050610871565b50505050905090810190601f1680156108b95780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156108d357600080fd5b5061092e600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050611f65565b005b34801561093c57600080fd5b50610945611fcc565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561098557808201518184015260208101905061096a565b50505050905090810190601f1680156109b25780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156109cc57600080fd5b506109d561206a565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610a155780820151818401526020810190506109fa565b50505050905090810190601f168015610a425780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610a5c57600080fd5b50610ab7600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612108565b005b348015610ac557600080fd5b50610ae8600480360381019080803560001916906020019092919050505061216f565b005b348015610af657600080fd5b50610aff6121ca565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610b3f578082015181840152602081019050610b24565b50505050905090810190601f168015610b6c5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610b8657600080fd5b50610b8f612268565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610bcf578082015181840152602081019050610bb4565b50505050905090810190601f168015610bfc5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610c1657600080fd5b50610c1f612306565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610c5f578082015181840152602081019050610c44565b50505050905090810190601f168015610c8c5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610ca657600080fd5b50610d01600480360381019080803590602001908201803590602001908080601f01602080910402602001604051908101604052809392919081815260200183838082843782019150505050505091929192905050506123a4565b005b348015610d0f57600080fd5b50610d6a600480360381019080803590602001908201803590602001908080601f016020809104026020016040519081016040528093929190818152602001838380828437820191505050505050919291929050505061240b565b005b348015610d7857600080fd5b50610d81612472565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610dc1578082015181840152602081019050610da6565b50505050905090810190601f168015610dee5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610e0857600080fd5b50610e63600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612510565b005b348015610e7157600080fd5b50610ecc600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612577565b005b348015610eda57600080fd5b50610ee36125de565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015610f23578082015181840152602081019050610f08565b50505050905090810190601f168015610f505780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b348015610f6a57600080fd5b50610fc5600480360381019080803590602001908201803590602001908080601f016020809104026020016040519081016040528093929190818152602001838380828437820191505050505050919291929050505061267c565b005b348015610fd357600080fd5b50610fdc6126e3565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561102a57600080fd5b50611033612709565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015611073578082015181840152602081019050611058565b50505050905090810190601f1680156110a05780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156110ba57600080fd5b506110c36127a7565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156111035780820151818401526020810190506110e8565b50505050905090810190601f1680156111305780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561114a57600080fd5b506111a5600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612845565b005b3480156111b357600080fd5b506111bc6128ac565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156111fc5780820151818401526020810190506111e1565b50505050905090810190601f1680156112295780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561124357600080fd5b5061124c61294a565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561128c578082015181840152602081019050611271565b50505050905090810190601f1680156112b95780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156112d357600080fd5b506112dc6129e8565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561131c578082015181840152602081019050611301565b50505050905090810190601f1680156113495780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561136357600080fd5b506113866004803603810190808035600019169060200190929190505050612a86565b005b34801561139457600080fd5b5061139d612ae1565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156113dd5780820151818401526020810190506113c2565b50505050905090810190601f16801561140a5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561142457600080fd5b5061147f600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612b7f565b005b34801561148d57600080fd5b506114e8600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612be6565b005b3480156114f657600080fd5b50611551600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612c4d565b005b34801561155f57600080fd5b50611568612cb4565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156115a857808201518184015260208101905061158d565b50505050905090810190601f1680156115d55780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156115ef57600080fd5b506115f8612d52565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561163857808201518184015260208101905061161d565b50505050905090810190601f1680156116655780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561167f57600080fd5b506116da600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612df0565b005b3480156116e857600080fd5b506116f1612e57565b6040518080602001828103825283818151815260200191508051906020019080838360005b83811015611731578082015181840152602081019050611716565b50505050905090810190601f16801561175e5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561177857600080fd5b50611781612ef5565b60405180826000191660001916815260200191505060405180910390f35b3480156117ab57600080fd5b50611806600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612efb565b005b34801561181457600080fd5b5061186f600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612f62565b005b34801561187d57600080fd5b506118d8600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050612fc9565b005b60188060009054906101000a900460ff1660ff16101561193e5780600d908051906020019061190a929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff1610156119a5578060029080519060200190611971929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015611a0c5780601690805190602001906119d8929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60015481565b60188060009054906101000a900460ff1660ff161015611a79578060179080519060200190611a45929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015611ae0578060129080519060200190611aac929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60168054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611b795780601f10611b4e57610100808354040283529160200191611b79565b820191906000526020600020905b815481529060010190602001808311611b5c57829003601f168201915b505050505081565b60028054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611c175780601f10611bec57610100808354040283529160200191611c17565b820191906000526020600020905b815481529060010190602001808311611bfa57829003601f168201915b505050505081565b600a8054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611cb55780601f10611c8a57610100808354040283529160200191611cb5565b820191906000526020600020905b815481529060010190602001808311611c9857829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff161015611d21578060009080519060200190611ced929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015611d88578060139080519060200190611d54929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b600c8054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611e215780601f10611df657610100808354040283529160200191611e21565b820191906000526020600020905b815481529060010190602001808311611e0457829003601f168201915b505050505081565b60158054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611ebf5780601f10611e9457610100808354040283529160200191611ebf565b820191906000526020600020905b815481529060010190602001808311611ea257829003601f168201915b505050505081565b60058054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611f5d5780601f10611f3257610100808354040283529160200191611f5d565b820191906000526020600020905b815481529060010190602001808311611f4057829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff161015611fc9578060069080519060200190611f95929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60108054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156120625780601f1061203757610100808354040283529160200191612062565b820191906000526020600020905b81548152906001019060200180831161204557829003601f168201915b505050505081565b60148054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156121005780601f106120d557610100808354040283529160200191612100565b820191906000526020600020905b8154815290600101906020018083116120e357829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff16101561216c578060079080519060200190612138929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff1610156121c75780600181600019169055506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60088054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156122605780601f1061223557610100808354040283529160200191612260565b820191906000526020600020905b81548152906001019060200180831161224357829003601f168201915b505050505081565b60098054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156122fe5780601f106122d3576101008083540402835291602001916122fe565b820191906000526020600020905b8154815290600101906020018083116122e157829003601f168201915b505050505081565b60068054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561239c5780601f106123715761010080835404028352916020019161239c565b820191906000526020600020905b81548152906001019060200180831161237f57829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff1610156123d65780600f90805190602001906123d4929190613030565b505b6018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff1602179055505050565b60188060009054906101000a900460ff1660ff16101561246f5780600a908051906020019061243b929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b600b8054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156125085780601f106124dd57610100808354040283529160200191612508565b820191906000526020600020905b8154815290600101906020018083116124eb57829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff1610156125745780600b9080519060200190612540929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff1610156125db5780600990805190602001906125a7929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60078054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156126745780601f1061264957610100808354040283529160200191612674565b820191906000526020600020905b81548152906001019060200180831161265757829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff1610156126e05780600590805190602001906126ac929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b601860019054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60008054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561279f5780601f106127745761010080835404028352916020019161279f565b820191906000526020600020905b81548152906001019060200180831161278257829003601f168201915b505050505081565b600f8054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561283d5780601f106128125761010080835404028352916020019161283d565b820191906000526020600020905b81548152906001019060200180831161282057829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff1610156128a9578060089080519060200190612875929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60128054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156129425780601f1061291757610100808354040283529160200191612942565b820191906000526020600020905b81548152906001019060200180831161292557829003601f168201915b505050505081565b60178054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156129e05780601f106129b5576101008083540402835291602001916129e0565b820191906000526020600020905b8154815290600101906020018083116129c357829003601f168201915b505050505081565b600d8054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015612a7e5780601f10612a5357610100808354040283529160200191612a7e565b820191906000526020600020905b815481529060010190602001808311612a6157829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff161015612aac5780600381600019169055505b6018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff1602179055505050565b60118054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015612b775780601f10612b4c57610100808354040283529160200191612b77565b820191906000526020600020905b815481529060010190602001808311612b5a57829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff161015612be3578060109080519060200190612baf929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015612c4a5780600e9080519060200190612c16929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015612cb1578060149080519060200190612c7d929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60048054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015612d4a5780601f10612d1f57610100808354040283529160200191612d4a565b820191906000526020600020905b815481529060010190602001808311612d2d57829003601f168201915b505050505081565b600e8054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015612de85780601f10612dbd57610100808354040283529160200191612de8565b820191906000526020600020905b815481529060010190602001808311612dcb57829003601f168201915b505050505081565b60188060009054906101000a900460ff1660ff161015612e54578060159080519060200190612e20929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60138054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015612eed5780601f10612ec257610100808354040283529160200191612eed565b820191906000526020600020905b815481529060010190602001808311612ed057829003601f168201915b505050505081565b60035481565b60188060009054906101000a900460ff1660ff161015612f5f5780600c9080519060200190612f2b929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff161015612fc6578060049080519060200190612f92929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b60188060009054906101000a900460ff1660ff16101561302d578060119080519060200190612ff9929190613030565b506018600081819054906101000a900460ff168092919060010191906101000a81548160ff021916908360ff160217905550505b50565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061307157805160ff191683800117855561309f565b8280016001018555821561309f579182015b8281111561309e578251825591602001919060010190613083565b5b5090506130ac91906130b0565b5090565b6130d291905b808211156130ce5760008160009055506001016130b6565b5090565b905600a165627a7a723058203d827ec46a2b71de2b8748dfa3a21919eb59842fb06ec3238974bfed282601dd0029', 
	     gas: '4700000'
	   }, function (e, contract){
	    console.log(e, contract);
	    if (typeof contract.address !== 'undefined') {
	         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
	         fn(contract.address);
	    }
	 });
}

function createContract(employee_name, employee_id,
                        employer_name, employer_id,
						begin_labor_date, end_labor_date,
						start_labor_time, finish_labor_time,
						working_hours_per_day, working_days_per_week,
						day_off, wage_type, wage, bonus_system, other_wage_system,
						pay_day_monthly, pay_day_weekly, pay_method, insurance, contract_date,
						company_name, company_address,
						employee_address, employee_contact,employee_num,employer_num,contract_num){

    getContract(function(addr){
        
	   var NewContract  = web3.eth.contract([{"constant":false,"inputs":[{"name":"_bonus_system","type":"string"}],"name":"set_bonus_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employer_name","type":"string"}],"name":"set_employer_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_address","type":"string"}],"name":"set_employee_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_contact","type":"string"}],"name":"set_employee_contact","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_insurance","type":"string"}],"name":"set_insurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"day_off","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_name","type":"string"}],"name":"set_employee_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_contract_date","type":"string"}],"name":"set_contract_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"end_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_start_labor_time","type":"string"}],"name":"set_start_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_weekly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_finish_labor_time","type":"string"}],"name":"set_finish_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_id_sha3_256","type":"bytes32"}],"name":"set_employee_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"working_hours_per_day","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"working_days_per_week","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"start_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_monthly","type":"string"}],"name":"set_pay_day_monthly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_day_off","type":"string"}],"name":"set_day_off","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage_type","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage_type","type":"string"}],"name":"set_wage_type","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_working_days_per_week","type":"string"}],"name":"set_working_days_per_week","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"finish_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_end_labor_date","type":"string"}],"name":"set_end_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"addr","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_monthly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_working_hours_per_day","type":"string"}],"name":"set_working_hours_per_day","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"insurance","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_contact","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"bonus_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employer_id_sha3_256","type":"bytes32"}],"name":"set_employer_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_method","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_weekly","type":"string"}],"name":"set_pay_day_weekly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_other_wage_system","type":"string"}],"name":"set_other_wage_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_company_name","type":"string"}],"name":"set_company_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"begin_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"other_wage_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_company_address","type":"string"}],"name":"set_company_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"contract_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage","type":"string"}],"name":"set_wage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_begin_labor_date","type":"string"}],"name":"set_begin_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_pay_method","type":"string"}],"name":"set_pay_method","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]).at(addr);
	    
	    NewContract.set_employee_name.sendTransaction(employee_name, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_employee_id_sha3_256.sendTransaction(web3.sha3(employee_id), {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_employer_name.sendTransaction(employer_name, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_employer_id_sha3_256.sendTransaction(web3.sha3(employer_id), {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_begin_labor_date.sendTransaction(begin_labor_date, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_end_labor_date.sendTransaction(end_labor_date, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_start_labor_time.sendTransaction(start_labor_time, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_finish_labor_time.sendTransaction(finish_labor_time, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_working_hours_per_day.sendTransaction(working_hours_per_day, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_working_days_per_week.sendTransaction(working_days_per_week, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_day_off.sendTransaction(day_off, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_wage_type.sendTransaction(wage_type, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_wage.sendTransaction(wage, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_bonus_system.sendTransaction(bonus_system, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_other_wage_system.sendTransaction(other_wage_system, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_pay_day_monthly.sendTransaction(pay_day_monthly, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_pay_day_weekly.sendTransaction(pay_day_weekly, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_pay_method.sendTransaction(pay_method, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_insurance.sendTransaction(insurance, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_contract_date.sendTransaction(contract_date, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_company_name.sendTransaction(company_name, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_company_address.sendTransaction(company_address, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_employee_address.sendTransaction(employee_address, {from:web3.eth.accounts[0],gas:500000});
        NewContract.set_employee_contact.sendTransaction(employee_contact, {from:web3.eth.accounts[0],gas:500000});
        
        dbconn.query('insert into contract_info (employee_num,employer_num,contract_address) values(?,?,?)',[employee_num,employer_num,addr],function(error,result){
        	if(error){
        		console.log(error);
        	}
        });
        
        dbconn.query('delete from temp_contract where contract_num=?',[contract_num],function(error,result){
        	if(error){
        		console.log(error);
        	}
        	console.log('계약서가 정상적으로 블록화 되었습니다.');
        	
        	
        });
   
   }); 
}
//////set함수 선언부분끝
function getContractContent(addr){
	var EmpContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"_bonus_system","type":"string"}],"name":"set_bonus_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employer_name","type":"string"}],"name":"set_employer_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_address","type":"string"}],"name":"set_employee_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_contact","type":"string"}],"name":"set_employee_contact","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_insurance","type":"string"}],"name":"set_insurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"employee_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"day_off","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employee_name","type":"string"}],"name":"set_employee_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_contract_date","type":"string"}],"name":"set_contract_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_address","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"end_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_start_labor_time","type":"string"}],"name":"set_start_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_weekly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"company_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_finish_labor_time","type":"string"}],"name":"set_finish_labor_time","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_employee_id_sha3_256","type":"bytes32"}],"name":"set_employee_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"working_hours_per_day","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"working_days_per_week","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"start_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_monthly","type":"string"}],"name":"set_pay_day_monthly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_day_off","type":"string"}],"name":"set_day_off","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"wage_type","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage_type","type":"string"}],"name":"set_wage_type","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_working_days_per_week","type":"string"}],"name":"set_working_days_per_week","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"finish_labor_time","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_end_labor_date","type":"string"}],"name":"set_end_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"addr","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"pay_day_monthly","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_working_hours_per_day","type":"string"}],"name":"set_working_hours_per_day","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"insurance","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employee_contact","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"bonus_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_employer_id_sha3_256","type":"bytes32"}],"name":"set_employer_id_sha3_256","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"pay_method","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_pay_day_weekly","type":"string"}],"name":"set_pay_day_weekly","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_other_wage_system","type":"string"}],"name":"set_other_wage_system","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_company_name","type":"string"}],"name":"set_company_name","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"begin_labor_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"other_wage_system","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_company_address","type":"string"}],"name":"set_company_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"contract_date","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"employer_id_sha3_256","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_wage","type":"string"}],"name":"set_wage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_begin_labor_date","type":"string"}],"name":"set_begin_labor_date","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_pay_method","type":"string"}],"name":"set_pay_method","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]).at(addr);
    console.log(addr);
	var data = new Object();
	data.employee_name = EmpContract.employee_name.call();
	data.employee_id_sha3_256 = EmpContract.employee_id_sha3_256.call();
	data.employer_name = EmpContract.employer_name.call();
	data.employer_id_sha3_256 = EmpContract.employer_id_sha3_256.call();
	data.begin_labor_date = EmpContract.begin_labor_date.call();
	data.end_labor_date = EmpContract.end_labor_date.call();
	data.start_labor_time = EmpContract.start_labor_time.call();
	data.finish_labor_time = EmpContract.finish_labor_time.call();
	data.working_hours_per_day = EmpContract.working_hours_per_day.call();
	data.working_days_per_week = EmpContract.working_days_per_week.call();
	data.day_off = EmpContract.day_off.call();
	data.wage_type = EmpContract.wage_type.call();
	data.wage = EmpContract.wage.call();
	data.bonus_system = EmpContract.bonus_system.call();
	data.other_wage_system = EmpContract.other_wage_system.call();
	data.pay_day_monthly = EmpContract.pay_day_monthly.call();
	data.pay_day_weekly = EmpContract.pay_day_weekly.call();
	data.pay_method = EmpContract.pay_method.call();
	data.insurance = EmpContract.insurance.call();
	data.contract_date = EmpContract.contract_date.call();
	data.company_name = EmpContract.company_name.call();
	data.company_address = EmpContract.company_address.call();
	data.employee_address = EmpContract.employee_address.call();
	data.employee_contact = EmpContract.employee_contact.call();
 
	var jsonData = JSON.stringify(data);
	return jsonData;
}

