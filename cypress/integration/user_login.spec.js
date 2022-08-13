describe('User Login', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get(".products-index").should("be.visible");
    cy.get(".products article").should("have.length", 2);
  });


  it("Successfully registers a new user", () => {
    // Navigates to registration page
    cy.get(".navbar-nav li.nav-item").contains("Register").click({ force: true });
    cy.contains("h1", "Signup!").should("be.visible");

    // Input registration details
    cy.get('input[name="user[first_name]"]').type("Steven");
    cy.get('input[name="user[last_name]"]').type("Ngov");
    cy.get('input[name="user[email]"]').type("gl.steven.ngov@gmail.com");
    cy.get('input[name="user[password]"]').type("12345");
    cy.get('input[name="user[password_confirmation]"]').type("12345");

    cy.get('input[name="commit"]').click();

    // Check that user is logged in and returned to home page
    cy.contains("Signed in as Steven Ngov");
    cy.get(".products-index").should("be.visible");
  });


  it("Successfully login a registered user", () => {
    // Navigates to login page
    cy.get(".navbar-nav li.nav-item").contains("Login").click({ force: true });
    cy.contains("h1", "Login").should("be.visible");

    // Input login credentials
    cy.get('input[name="email"]').type("andrew.ngov@gmail.com");
    cy.get('input[name="password"]').type("12345");

    cy.get('input[name="commit"]').click();

    // Check that user is logged in and returned to home page
    cy.contains("Signed in as Andrew Ngov");
    cy.get(".products-index").should("be.visible");
  });

});
