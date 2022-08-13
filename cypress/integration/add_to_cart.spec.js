describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get(".products-index").should("be.visible");
    cy.get(".products article").should("have.length", 2);
  });

  it("Adds a product to cart and increases the cart count by 1", () => {
    cy.get("article div").contains("Add").click({ force: true });
    cy.get(".navbar-nav li.nav-item").contains("1");
  });

});
