<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Stock Management</title>
</head>
<body>

<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="index2.jsp" class="navbar-brand">SPharma</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="index2.jsp" class="nav-link active">Home</a>
          </li>
          <li class="nav-item px-2">
            <a href="#" class="nav-link">About</a>
          </li>
          <li class="nav-item px-2">
            <a href="#" class="nav-link">Contact</a>
          </li>
         </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="login1.jsp" class="nav-link">
               Login
            </a>
            </li>
          <li class="nav-item">
            <a href="registration1.jsp" class="nav-link">
               Sign Up
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>

<div class="container">
<header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
         <img src="Image/icon.png" class="rounded float-left" alt="Abusaquib"> <h1>Item Stock Management</h1>
        </div>
      </div>
    </div>
  </header>
  </div>
  
  <div class="container">
  <div class="jumbotron">
  
  <p class="lead">A leading multinational pharmaceutical company that uses latest technology to produce high quality medicines and care accessible to all.</p>
  <hr class="my-4">
  <p>A pharmaceutical company distributes their pharmaceutical and healthcare products, supplies and prescription drugs to a lot of distribution centers.</p>
  <a class="btn btn-primary btn-lg" href="https://www.cipla.com/" role="button">Learn more</a>
</div>

</div>

<!-- FOOTER -->
   <div class="container">
  <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="container">
      <div class="row">
        <div class="col">
          <p class="lead text-center">
            Copyright &copy;
            <span id="year"></span>
            SPharma
          </p>
        </div>
      </div>
    </div>
  </footer>
  </div>
  
  
  
  
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   </body>
   <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());
  </script>
</html>
  
 </body>
</html>