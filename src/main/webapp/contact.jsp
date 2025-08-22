<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<div class="card">
    <h2>We will Contact 📞 you, Please share your details</h2>
    <form action="contact" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" placeholder="Your Message" required></textarea>
        <button type="submit" class="cta-btn full-width">Submit Details</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
