CREATE TABLE [dbo].['Fact  Employee Central Table$'] (
[Table_Id] nvarchar(MAX),
[Position_ID] nvarchar(255),
[Employee_Status] nvarchar(255),
[Username] nvarchar(255),
[First_Name] nvarchar(255),
[Middle_Name] nvarchar(255),
[Last_Name] nvarchar(255),
[Business_Email_Information_Email_Address] nvarchar(255),
[CTC_Currency] nvarchar(255),
[FIXPAY_Amount] nvarchar(MAX),
[RETIRALS_Amount] nvarchar(MAX),
[VARPAY_Amount] nvarchar(MAX),
[OTE_Amount] nvarchar(MAX),
[AnnualFringe_Amount] nvarchar(MAX),
[CTC_Amount] nvarchar(MAX),
[Job_Code_Band_Sub_Band] nvarchar(255),
[BU_SSU_Description] nvarchar(255),
[LOB_Segment_Description] nvarchar(255),
[Vertical_Description] nvarchar(255),
[Sub_Vertical_Description] nvarchar(255),
[Entity_Description] nvarchar(255),
[Reporting_Manager_User_Sys_ID] nvarchar(255),
[Reporting_Manager] nvarchar(255),
[Cost_Center_Description] nvarchar(255),
[International_Region] nvarchar(255),
[Facility_Country] nvarchar(255),
[Facility_Description] nvarchar(255),
[Band_Sub_Band_Description] nvarchar(255),
[Job_Level] nvarchar(255),
[Designation_Desc] nvarchar(255),
[Title] nvarchar(255),
[Employment_Details_Tata_Group_Joining_Date] nvarchar(MAX),
[Employment_Details_Hire_Date] nvarchar(MAX),
[Employment_Details_Last_Working_Date] nvarchar(255),
[Employment_Details_Termination_Date] nvarchar(255),
[Event] nvarchar(255),
[Event_Reason] nvarchar(255),
[Employee_Type] nvarchar(255),
[Employee_Class] nvarchar(255),
[Job_Family_Description] nvarchar(255),
[Internal_Specialization_Name] nvarchar(255),
[Job_Code] nvarchar(255),
[Job_Code_Description] nvarchar(255),
[Variable_Pay_Plan_Type] nvarchar(255),
[Gender] nvarchar(255),
[Account_ID] nvarchar(255),
[BU_SSU_Code] nvarchar(255),
[LOB_Segment_Code] nvarchar(255),
[Vertical_Code] nvarchar(255),
[Sub_Vertical_Code] nvarchar(255),
[Cost_Center_Code] nvarchar(255),
[Name] nvarchar(255),
[Confirmation_Date] nvarchar(255),
[Geozone_Description] nvarchar(255),
[Geozone_Code] nvarchar(255),
[Geozone_Name] nvarchar(255),
[Entity_Code] nvarchar(255),
[Job_Code_Job_Code] nvarchar(255),
[Date_Of_Birth] nvarchar(255),
[Country_Of_Birth] nvarchar(255),
[Marital_Status] nvarchar(255),
[BU_SSU_GMC_Member] nvarchar(255),
[Facility_Country_II] nvarchar(255),
[Designation] nvarchar(255),
[Last_Promotion_Date] nvarchar(255),
[India_Global_Information_Category] nvarchar(255),
[India_Global_Information_Fathers_Name] nvarchar(255),
[India_Permanent_Account_Number_National_ID] nvarchar(255),
[United_States_Global_Information_Ethnic_Group] nvarchar(255),
[United_States_Global_Information_Ethnicity] nvarchar(255),
[United_States_Global_Information_Disabled] nvarchar(255),
[United_States_Global_Information_Veteran] nvarchar(255),
[United_States_Global_Information_Disabled_Veteran] nvarchar(255),
[United_States_Global_Information_Other_Protected_Veteran] nvarchar(255),
[United_States_Global_Information_Armed_Forces_Medal_Veteran] nvarchar(255),
[United_States_Global_Information_Recently_Separated_Veteran] nvarchar(255),
[United_States_Global_Information_Special_Disabled_Veteran] nvarchar(255),
[United_States_Global_Information_Vietnam_Era_Veteran] nvarchar(255),
[United_States_Global_Information_Other_Disabled_Veteran] nvarchar(255),
[United_States_Global_Information_Visa_Type] nvarchar(255),
[Union_Non_Union] nvarchar(255),
[Home_Country] nvarchar(255),
[Transfer_Type] nvarchar(255),
[Secondment_LTA] nvarchar(255),
[Employment_Details_Retirement_Date] nvarchar(255),
[Employment_Details_Personal_Email] nvarchar(255),
[BU_HR_SPOC_Job_Relationships_Name] nvarchar(255),
[BU_HR_SPOC_Job_Relationships_User_ID] nvarchar(MAX),
[REGIONAL_HR_Job_Relationships_User_ID] nvarchar(MAX),
[REGIONAL_HR_Job_Relationships_Name] nvarchar(255),
[BU_HR_Head_Job_Relationships_User_ID] nvarchar(255),
[BU_HR_Head_Job_Relationships_Name] nvarchar(255),
[Home_Cellphone_Formatted_Phone_Number] nvarchar(255),
[Business_Cellphone_Phone_Information_Phone_Number] nvarchar(255),
[Personal_Email_Information_Email_Address] nvarchar(255),
[Entity_SAP_Entity_Code] nvarchar(255),
[BI_end_Date] nvarchar(255),
[Business_Cellphone_Formatted_Phone_Number] nvarchar(255),
[Last_Modified_Date] nvarchar(255),
[Business_unit] nvarchar(255),
[Tenure Range] nvarchar(255)
)
bulk insert ['Fact  Employee Central Table$']
from 'C:\Users\Shivangi Sharma\Documents\fact1.tsv'
with 
(
fieldterminator = '	',
rowterminator = '\n',
firstrow = 2 
)

select * from ['Fact  Employee Central Table$']
select [Last_promotion_Date] from ['Fact  Employee Central Table$']

select[Last_Promotion_Date], (CASE when datediff(DAY,4-1-2017,4-1-2018)<18 then '0-18' 
when (datediff(month,4-1-2016,4-1-2018)>18 and datediff(month,4-1-2016,4-1-2018)<36)
then '18-36' 
when (datediff(month,4-1-2014,4-1-2018)>36 and
datediff(month,4-1-2014,4-1-2018)<54 )
then '36-54' 
when datediff(month,4-1-1999,4-1-2018)> 54
then '54+'
end )as Dif from ['Fact  Employee Central Table$']


