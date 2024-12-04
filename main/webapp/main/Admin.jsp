<%
HttpSession s=request.getSession(false);
if(s==null || s.getAttribute("username")==null)
{
	response.sendRedirect(request.getContextPath()+"/Login");
}
else
{
String userName = (String)s.getAttribute("username");

}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/database/Connection.jsp" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() +"/main/css/Admin.css"%>" />
  </head>
  <body>
    <nav
      class="navbar bg-dark position-sticky top-0 end-0 w-100 p-3"
      id="mainNavBar"
    >
      <div class="container-fluid d-flex justify-content-evenly">
        <a class="navbar-brand text-light float-end" href="#"
          >Hospital Management System</a
        >
        <div class="container d-flex justify-content-around align-items-center">
          <p class="text-light mt-2 fs-5" id="onPageClickChange"></p>
          <input
            class="form-control w-25"
            type="text"
            placeholder="Search For Anything"
            id="searchInput"
          />
        </div>
       <!--  <button
          type="button"
          class="btn btn-primary rounded float-end"
          id="addBtn"
        >
          Add +
        </button> -->
        
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="30"
            height="30"
            fill="white"
            class="bi bi-gear me-5"
            viewBox="0 0 16 16"
            id="settingsIcon"
            role="button"
          >
            <path
              d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0"
            />
            <path
              d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"
            /></svg>
       <a href="<%=request.getContextPath() + "/Logout" %>"><svg
            xmlns="http://www.w3.org/2000/svg"
            width="30"
            height="30"
            fill="white"
            class="bi bi-box-arrow-right me-3"
            viewBox="0 0 16 16"
            role="button"
          >
            <path
              fill-rule="evenodd"
              d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"
            />
            <path
              fill-rule="evenodd"
              d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"
             onclick="<%=request.getContextPath() + "/Logout" %>"
            /></svg
          ></a>
      </div>
    </nav>

    <div class="container-fluid bg-dark position-fixed start-0" id="sideBar">
      <div class="list-group mt-4">
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="overviewClicked">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                fill="currentColor"
                class="bi bi-columns-gap me-3"
                viewBox="0 0 16 16"
              >
                <path
                  d="M6 1v3H1V1zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1zm14 12v3h-5v-3zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1zM6 8v7H1V8zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1zm14-6v7h-5V1zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"
                /></svg
              >Overview
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="patientClicked">
              
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M240 80l102.7 0c-7.9-19.5-20.4-36.5-36.2-49.9L240 80zm37.7-68.2C261.3 4.2 243.2 0 224 0c-53.7 0-99.7 33.1-118.7 80l81.4 0 91-68.2zM224 256c70.7 0 128-57.3 128-128c0-5.4-.3-10.8-1-16L97 112c-.7 5.2-1 10.6-1 16c0 70.7 57.3 128 128 128zM124 312.4c-9.7 3.1-19.1 7-28 11.7L96 512l147.7 0L181.5 408.2 124 312.4zm33-7.2L204.3 384l67.7 0c44.2 0 80 35.8 80 80c0 18-6 34.6-16 48l82.3 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0c-7.2 0-14.3 .4-21.3 1.3zM0 482.3C0 498.7 13.3 512 29.7 512L64 512l0-166.6C24.9 378.1 0 427.3 0 482.3zM320 464c0-26.5-21.5-48-48-48l-48.5 0 57.1 95.2C303 507.2 320 487.6 320 464z"/></svg>Patient
            </h5>
          </div>
        </a>
        <a
          href="#Doctor"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true" 
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="doctorClicked">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M142.4 21.9c5.6 16.8-3.5 34.9-20.2 40.5L96 71.1 96 192c0 53 43 96 96 96s96-43 96-96l0-120.9-26.1-8.7c-16.8-5.6-25.8-23.7-20.2-40.5s23.7-25.8 40.5-20.2l26.1 8.7C334.4 19.1 352 43.5 352 71.1L352 192c0 77.2-54.6 141.6-127.3 156.7C231 404.6 278.4 448 336 448c61.9 0 112-50.1 112-112l0-70.7c-28.3-12.3-48-40.5-48-73.3c0-44.2 35.8-80 80-80s80 35.8 80 80c0 32.8-19.7 61-48 73.3l0 70.7c0 97.2-78.8 176-176 176c-92.9 0-168.9-71.9-175.5-163.1C87.2 334.2 32 269.6 32 192L32 71.1c0-27.5 17.6-52 43.8-60.7l26.1-8.7c16.8-5.6 34.9 3.5 40.5 20.2zM480 224a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"/></svg>Doctor
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="employeeClicked">
             
 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="20" height="20" class="bi bi-columns-gap me-3">
        <path fill="white" d="M96 128l0-57.8c0-13.3 8.3-25.3 20.8-30l96-36c7.2-2.7 15.2-2.7 22.5 0l96 36c12.5 4.7 20.8 16.6 20.8 30l0 57.8-.3 0c.2 2.6 .3 5.3 .3 8l0 40c0 70.7-57.3 128-128 128s-128-57.3-128-128l0-40c0-2.7 .1-5.4 .3-8l-.3 0zm48 48c0 44.2 35.8 80 80 80s80-35.8 80-80l0-16-160 0 0 16zM111.9 327.7c10.5-3.4 21.8 .4 29.4 8.5l71 75.5c6.3 6.7 17 6.7 23.3 0l71-75.5c7.6-8.1 18.9-11.9 29.4-8.5C401 348.6 448 409.4 448 481.3c0 17-13.8 30.7-30.7 30.7L30.7 512C13.8 512 0 498.2 0 481.3c0-71.9 47-132.7 111.9-153.6zM208 48l0 16-16 0c-4.4 0-8 3.6-8 8l0 16c0 4.4 3.6 8 8 8l16 0 0 16c0 4.4 3.6 8 8 8l16 0c4.4 0 8-3.6 8-8l0-16 16 0c4.4 0 8-3.6 8-8l0-16c0-4.4-3.6-8-8-8l-16 0 0-16c0-4.4-3.6-8-8-8l-16 0c-4.4 0-8 3.6-8 8z"/>
        </svg>Employees
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="wardClicked">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M32 32c17.7 0 32 14.3 32 32l0 256 224 0 0-160c0-17.7 14.3-32 32-32l224 0c53 0 96 43 96 96l0 224c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-32-224 0-32 0L64 416l0 32c0 17.7-14.3 32-32 32s-32-14.3-32-32L0 64C0 46.3 14.3 32 32 32zm144 96a80 80 0 1 1 0 160 80 80 0 1 1 0-160z"/></svg>Wards
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="medicineClicked">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"  width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M64 144c0-26.5 21.5-48 48-48s48 21.5 48 48l0 112-96 0 0-112zM0 144L0 368c0 61.9 50.1 112 112 112s112-50.1 112-112l0-178.4c1.8 19.1 8.2 38 19.8 54.8L372.3 431.7c35.5 51.7 105.3 64.3 156 28.1s63-107.5 27.5-159.2L427.3 113.3C391.8 61.5 321.9 49 271.3 85.2c-28 20-44.3 50.8-47.3 83l0-24.2c0-61.9-50.1-112-112-112S0 82.1 0 144zm296.6 64.2c-16-23.3-10-55.3 11.9-71c21.2-15.1 50.5-10.3 66 12.2l67 97.6L361.6 303l-65-94.8zM491 407.7c-.8 .6-1.6 1.1-2.4 1.6l4-2.8c-.5 .4-1 .8-1.6 1.2z"/></svg>Medicines
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="paymentClicked">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M0 64C0 46.3 14.3 32 32 32l64 0 16 0 176 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-56.2 0c9.6 14.4 16.7 30.6 20.7 48l35.6 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-35.6 0c-13.2 58.3-61.9 103.2-122.2 110.9L274.6 422c14.4 10.3 17.7 30.3 7.4 44.6s-30.3 17.7-44.6 7.4L13.4 314C2.1 306-2.7 291.5 1.5 278.2S18.1 256 32 256l80 0c32.8 0 61-19.7 73.3-48L32 208c-17.7 0-32-14.3-32-32s14.3-32 32-32l153.3 0C173 115.7 144.8 96 112 96L96 96 32 96C14.3 96 0 81.7 0 64z"/></svg>Payments
            </h5>
          </div>
        </a>
        <a
          href="#"
          class="list-group-item list-group-item-action bg-dark border border-dark p-4"
          aria-current="true"
        >
          <div class="d-flex w-100 justify-content-evenly align-items-center mt-2">
            <h5 class="mb-1 fs-5 text-light" id="reportClicked">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"  width="20" height="20" class="bi bi-columns-gap me-3">
<path fill="white" d="M64 0C28.7 0 0 28.7 0 64L0 448c0 35.3 28.7 64 64 64l256 0c35.3 0 64-28.7 64-64l0-288-128 0c-17.7 0-32-14.3-32-32L224 0 64 0zM256 0l0 128 128 0L256 0zM160 240c0-8.8 7.2-16 16-16l32 0c8.8 0 16 7.2 16 16l0 48 48 0c8.8 0 16 7.2 16 16l0 32c0 8.8-7.2 16-16 16l-48 0 0 48c0 8.8-7.2 16-16 16l-32 0c-8.8 0-16-7.2-16-16l0-48-48 0c-8.8 0-16-7.2-16-16l0-32c0-8.8 7.2-16 16-16l48 0 0-48z"/></svg>Reports
            </h5>
          </div>
        </a>
        <hr class="border border-light w-100 mt-2" />
       
      </div>
    </div>
    <div class="container p-5 mt-3 w-100 h-100" id="rightSection">
    <div class="container-fluid d-flex justify-content-evenly align-items-center flex-wrap ">
      <div class="card mt-3" style="width: 30rem;">
      <div class="card-body">
      <h5 class="card-title" id="employeeCount">Total Employee
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-person-add float-end bg-primary rounded" viewBox="0 0 16 16">
      <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
      <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
      </svg>
      </h5>
      <p class="card-text mt-3">Employee Count : </p>
      <p class="btn btn-primary mt-3" id="goToEmployee">Go To Employee Page</p>
      </div>
      </div>
      <div class="card mt-3" style="width: 30rem;">
      <div class="card-body">
      <h5 class="card-title">Total Patients
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-person-add float-end bg-success rounded" viewBox="0 0 16 16">
      <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
      <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
      </svg>
      </h5>
      <p class="card-text mt-3">Patient Count : </p>
      <p class="btn btn-success mt-3" id="goToPatient">Go To Patient Page</p>
      </div>
      </div>
      <div class="card mt-3" style="width: 30rem;">
      <div class="card-body">
      <h5 class="card-title">Total Ward
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-person-video float-end bg-info rounded p-1" viewBox="0 0 16 16">
      <path d="M8 9.05a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
      <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zm10.798 11c-.453-1.27-1.76-3-4.798-3-3.037 0-4.345 1.73-4.798 3H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1z"/>
      </svg>
      </h5>
      <p class="card-text mt-3">Ward Count : </p>
      <p class="btn btn-info mt-3" id="goToWard">Go To Ward Page</p>
      </div>
      </div>
      <div class="card mt-3" style="width: 30rem;">
      <div class="card-body">
      <h5 class="card-title">Total Payments
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-credit-card-fill float-end  rounded" viewBox="0 0 16 16">
      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1"/>
      </svg>
      </h5>
      <p class="card-text mt-3">Payments : </p>
      <p class="btn btn-danger mt-3" id="goToPayments">Go To Payment Page</p>
      </div>
      </div>
      <div class="card mt-3" style="width: 30rem;">
      <div class="card-body">
      <h5 class="card-title">Total Medicines
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-capsule float-end rounded" viewBox="0 0 16 16">
      <path d="M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z" />
      </svg>
      </h5>
      <p class="card-text mt-3">Medicines Available : </p>
      <p class="btn btn-dark mt-3" id="goToMedicine">Go To Medicines Page</p>
      </div>
      </div>
      </div>    
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="main/js/Admin.js"></script>

    <%
    int patientId = -1;
    String patientName = "";
    int patientAge = -1;
    String patientPhnNo = "";
    String patientEmail = "";
    String patientDisease = "";
    	/* List<String,Object>
    	ps=con.prepareStatement("SELECT * FROM PATIENT");
    	rs = ps.executeQuery();
    	if(rs.next())
    	{
    			
    	} */
    %>
    </script>
  </body>
</html>
