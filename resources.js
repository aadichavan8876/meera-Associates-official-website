/**
 * ==============================================================================
 * MEERA ASSOCIATES - RESOURCES INTERACTIVE FUNCTIONALITY
 * ==============================================================================
 * Powers:
 * - Dynamic category filtering and keyword search on Blogs page
 * - Dynamic category filtering and search on News page
 * - Dynamic video gallery, category filters, and interactive modal player on Videos page
 * - Dynamic article loader on Blog Detail page
 * ==============================================================================
 */

document.addEventListener('DOMContentLoaded', () => {
    // --------------------------------------------------------------------------
    // 1. BLOGS PAGE CONTROLLER
    // --------------------------------------------------------------------------
    const blogsContainer = document.getElementById('blogs-container');
    const blogSearchInput = document.getElementById('blog-search-input');
    const blogFilterPills = document.querySelectorAll('.blog-filter-pill');

    if (blogsContainer && typeof resourcesData !== 'undefined' && resourcesData.blogs) {
        let activeCategory = 'all';
        let searchQuery = '';

        function renderBlogs() {
            const filtered = resourcesData.blogs.filter(blog => {
                const matchesCat = (activeCategory === 'all') || 
                                   (blog.category.toLowerCase() === activeCategory.toLowerCase());
                const matchesSearch = !searchQuery || 
                                      blog.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      blog.excerpt.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      blog.category.toLowerCase().includes(searchQuery.toLowerCase());
                return matchesCat && matchesSearch;
            });

            if (filtered.length === 0) {
                blogsContainer.innerHTML = `
                    <div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px; background: #ffffff; border-radius: 12px; border: 1px solid var(--border-color);">
                        <div style="font-size: 2.5rem; margin-bottom: 12px;">🔍</div>
                        <h3 style="font-size: 1.3rem; color: var(--text-main); margin-bottom: 8px;">No Articles Found</h3>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">Try adjusting your search terms or selecting a different category filter.</p>
                    </div>
                `;
                return;
            }

            blogsContainer.innerHTML = filtered.map(blog => `
                <article class="blog-card" data-category="${blog.category}">
                    <a href="blog-detail.html?id=${encodeURIComponent(blog.id)}" class="blog-card-img-link" aria-label="${blog.title}">
                        <div class="blog-card-img-wrap">
                            <img src="${blog.image || 'assets/resources/blog_valuations.jpg'}" alt="${blog.title}" class="blog-card-img" loading="lazy">
                            <span class="blog-card-cat-badge">${blog.category}</span>
                        </div>
                    </a>
                    <div class="blog-card-body">
                        <div class="blog-card-meta">
                            <span class="blog-card-date">${blog.date}</span>
                            <span class="blog-read-time">⏱️ ${blog.readTime}</span>
                        </div>
                        <h3 class="blog-card-title">
                            <a href="blog-detail.html?id=${encodeURIComponent(blog.id)}">${blog.title}</a>
                        </h3>
                        <p class="blog-card-excerpt">${blog.excerpt}</p>
                    </div>
                    <div class="blog-card-footer">
                        <span class="blog-author-tag">By Meera Research</span>
                        <a href="blog-detail.html?id=${encodeURIComponent(blog.id)}" class="blog-read-btn">
                            Read More <span>→</span>
                        </a>
                    </div>
                </article>
            `).join('');
        }

        renderBlogs();

        // Category click handlers
        blogFilterPills.forEach(pill => {
            pill.addEventListener('click', () => {
                blogFilterPills.forEach(p => p.classList.remove('active'));
                pill.classList.add('active');
                activeCategory = pill.getAttribute('data-category') || 'all';
                renderBlogs();
            });
        });

        // Search input handler
        if (blogSearchInput) {
            blogSearchInput.addEventListener('input', (e) => {
                searchQuery = e.target.value.trim();
                renderBlogs();
            });
        }
    }

    // --------------------------------------------------------------------------
    // 2. BLOG DETAIL PAGE CONTROLLER
    // --------------------------------------------------------------------------
    const blogDetailContainer = document.getElementById('blog-detail-container');
    if (blogDetailContainer && typeof resourcesData !== 'undefined' && resourcesData.blogs) {
        const urlParams = new URLSearchParams(window.location.search);
        const articleId = urlParams.get('id') || resourcesData.blogs[0].id;
        const article = resourcesData.blogs.find(b => b.id === articleId) || resourcesData.blogs[0];

        // Set page title
        document.title = `${article.title} | Meera Associates`;

        // Render main article
        document.getElementById('article-category').innerText = article.category;
        document.getElementById('article-date').innerText = article.date;
        document.getElementById('article-read-time').innerText = `⏱️ ${article.readTime}`;
        document.getElementById('article-title').innerText = article.title;
        document.getElementById('article-author').innerText = article.author || 'Meera Associates Research Desk';
        document.getElementById('article-content').innerHTML = article.content;

        // Render featured article hero image
        const articleImg = document.getElementById('article-featured-img');
        if (articleImg) {
            articleImg.src = article.image || 'assets/resources/blog_valuations.jpg';
            articleImg.alt = article.title;
        }

        // Render related articles
        const relatedContainer = document.getElementById('related-blogs-container');
        if (relatedContainer) {
            const related = resourcesData.blogs
                .filter(b => b.id !== article.id)
                .slice(0, 2);

            relatedContainer.innerHTML = related.map(b => `
                <div class="blog-card related-blog-card" style="margin-top: 24px;">
                    <a href="blog-detail.html?id=${encodeURIComponent(b.id)}" class="blog-card-img-link" aria-label="${b.title}">
                        <div class="blog-card-img-wrap" style="height: 160px;">
                            <img src="${b.image || 'assets/resources/blog_valuations.jpg'}" alt="${b.title}" class="blog-card-img" loading="lazy">
                            <span class="blog-card-cat-badge">${b.category}</span>
                        </div>
                    </a>
                    <div class="blog-card-body">
                        <div class="blog-card-meta">
                            <span class="blog-card-date">${b.date}</span>
                            <span class="blog-read-time">⏱️ ${b.readTime}</span>
                        </div>
                        <h4 style="font-size: 1.12rem; font-weight: 700; color: var(--text-main); margin-bottom: 8px;">
                            <a href="blog-detail.html?id=${encodeURIComponent(b.id)}">${b.title}</a>
                        </h4>
                        <p style="color: var(--text-muted); font-size: 0.88rem; line-height: 1.5; margin-bottom: 16px;">${b.excerpt}</p>
                    </div>
                    <div class="blog-card-footer">
                        <a href="blog-detail.html?id=${encodeURIComponent(b.id)}" class="blog-read-btn">
                            Read Article <span>→</span>
                        </a>
                    </div>
                </div>
            `).join('');
        }
    }

    // --------------------------------------------------------------------------
    // 3. NEWS PAGE CONTROLLER
    // --------------------------------------------------------------------------
    const newsContainer = document.getElementById('news-container');
    const newsSearchInput = document.getElementById('news-search-input');
    const newsFilterPills = document.querySelectorAll('.news-filter-pill');

    if (newsContainer && typeof resourcesData !== 'undefined' && resourcesData.news) {
        let activeCategory = 'all';
        let searchQuery = '';

        function renderNews() {
            const filtered = resourcesData.news.filter(item => {
                const matchesCat = (activeCategory === 'all') || 
                                   (item.category.toLowerCase() === activeCategory.toLowerCase());
                const matchesSearch = !searchQuery || 
                                      item.headline.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      item.summary.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      item.source.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      item.category.toLowerCase().includes(searchQuery.toLowerCase());
                return matchesCat && matchesSearch;
            });

            if (filtered.length === 0) {
                newsContainer.innerHTML = `
                    <div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px; background: #ffffff; border-radius: 12px; border: 1px solid var(--border-color);">
                        <div style="font-size: 2.5rem; margin-bottom: 12px;">📰</div>
                        <h3 style="font-size: 1.3rem; color: var(--text-main); margin-bottom: 8px;">No News Found</h3>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">No news matches your search or category filter. Try clearing your filters.</p>
                    </div>
                `;
                return;
            }

            newsContainer.innerHTML = filtered.map(item => `
                <article class="news-card">
                    <div class="news-card-img-wrap">
                        <img src="${item.image || 'assets/resources/news_sebi.jpg'}" alt="${item.headline}" class="news-card-img" loading="lazy">
                        <span class="news-source-overlay-badge">🗞️ ${item.source}</span>
                    </div>
                    <div class="news-card-body">
                        <div class="news-card-header">
                            <span class="category-tag">${item.category}</span>
                            <span class="news-date-badge">${item.date}</span>
                        </div>
                        <h3 class="news-headline">
                            <a href="${item.sourceUrl}" target="_blank" rel="noopener noreferrer">${item.headline}</a>
                        </h3>
                        <p class="news-summary">${item.summary}</p>
                    </div>
                    <div class="news-card-footer">
                        <span class="news-read-time">⏱️ ${item.readTime || '3 min read'}</span>
                        <a href="${item.sourceUrl}" target="_blank" rel="noopener noreferrer" class="news-read-btn">
                            Read on ${item.source} <span>↗</span>
                        </a>
                    </div>
                </article>
            `).join('');
        }

        renderNews();

        newsFilterPills.forEach(pill => {
            pill.addEventListener('click', () => {
                newsFilterPills.forEach(p => p.classList.remove('active'));
                pill.classList.add('active');
                activeCategory = pill.getAttribute('data-category') || 'all';
                renderNews();
            });
        });

        if (newsSearchInput) {
            newsSearchInput.addEventListener('input', (e) => {
                searchQuery = e.target.value.trim();
                renderNews();
            });
        }
    }

    // --------------------------------------------------------------------------
    // 4. VIDEOS PAGE CONTROLLER & MODAL PLAYER
    // --------------------------------------------------------------------------
    const videosContainer = document.getElementById('videos-container');
    const videoSearchInput = document.getElementById('video-search-input');
    const videoFilterPills = document.querySelectorAll('.video-filter-pill');
    const videoModal = document.getElementById('video-modal');
    const videoModalIframe = document.getElementById('video-modal-iframe');
    const videoModalTitle = document.getElementById('video-modal-title');
    const videoModalClose = document.getElementById('video-modal-close');

    if (videosContainer && typeof resourcesData !== 'undefined' && resourcesData.videos) {
        let activeCategory = 'all';
        let searchQuery = '';

        function renderVideos() {
            const filtered = resourcesData.videos.filter(video => {
                const matchesCat = (activeCategory === 'all') || 
                                   (video.category.toLowerCase() === activeCategory.toLowerCase());
                const matchesSearch = !searchQuery || 
                                      video.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                                      (video.description && video.description.toLowerCase().includes(searchQuery.toLowerCase())) ||
                                      video.category.toLowerCase().includes(searchQuery.toLowerCase());
                return matchesCat && matchesSearch;
            });

            if (filtered.length === 0) {
                videosContainer.innerHTML = `
                    <div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px; background: #ffffff; border-radius: 12px; border: 1px solid var(--border-color);">
                        <div style="font-size: 2.5rem; margin-bottom: 12px;">🎥</div>
                        <h3 style="font-size: 1.3rem; color: var(--text-main); margin-bottom: 8px;">No Videos Found</h3>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">Try selecting another category or clearing your search keywords.</p>
                    </div>
                `;
                return;
            }

            videosContainer.innerHTML = filtered.map(video => `
                <div class="video-card" data-video-id="${video.id}" data-video-title="${encodeURIComponent(video.title)}">
                    <div class="video-thumb-container">
                        <img src="https://i.ytimg.com/vi/${video.id}/hqdefault.jpg" 
                             alt="${video.title}" 
                             class="video-thumb-img" 
                             loading="lazy"
                             onerror="this.src='assets/meera_associates_logo.png'">
                        <div class="video-play-overlay">▶</div>
                        <span class="video-duration-badge">${video.duration}</span>
                    </div>
                    <div class="video-card-body">
                        <div>
                            <div class="video-card-top-meta">
                                <span class="category-tag">${video.category}</span>
                                <span style="font-size: 0.76rem; color: var(--text-subtle); font-weight: 600;">${video.date}</span>
                            </div>
                            <h4 class="video-card-title">${video.title}</h4>
                            <p class="video-card-desc">${video.description || 'Watch insightful analysis from Meera Associates.'}</p>
                        </div>
                        <div class="video-card-footer">
                            <button type="button" class="video-watch-btn">
                                <span>Watch Video</span> ▶
                            </button>
                            <a href="https://www.youtube.com/watch?v=${video.id}" 
                               target="_blank" 
                               rel="noopener noreferrer" 
                               style="font-size: 0.78rem; color: var(--text-subtle); text-decoration: none;"
                               onclick="event.stopPropagation();">
                               Open in YouTube ↗
                            </a>
                        </div>
                    </div>
                </div>
            `).join('');

            // Attach click listeners to open modal
            videosContainer.querySelectorAll('.video-card').forEach(card => {
                card.addEventListener('click', () => {
                    const vidId = card.getAttribute('data-video-id');
                    const vidTitle = decodeURIComponent(card.getAttribute('data-video-title') || 'Video Player');
                    openVideoModal(vidId, vidTitle);
                });
            });
        }

        renderVideos();

        videoFilterPills.forEach(pill => {
            pill.addEventListener('click', () => {
                videoFilterPills.forEach(p => p.classList.remove('active'));
                pill.classList.add('active');
                activeCategory = pill.getAttribute('data-category') || 'all';
                renderVideos();
            });
        });

        if (videoSearchInput) {
            videoSearchInput.addEventListener('input', (e) => {
                searchQuery = e.target.value.trim();
                renderVideos();
            });
        }

        function openVideoModal(videoId, title) {
            if (!videoModal || !videoModalIframe) return;
            videoModalIframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0&modestbranding=1`;
            if (videoModalTitle) videoModalTitle.innerText = title;
            videoModal.classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeVideoModal() {
            if (!videoModal || !videoModalIframe) return;
            videoModalIframe.src = '';
            videoModal.classList.remove('active');
            document.body.style.overflow = '';
        }

        if (videoModalClose) {
            videoModalClose.addEventListener('click', closeVideoModal);
        }

        if (videoModal) {
            videoModal.addEventListener('click', (e) => {
                if (e.target === videoModal) {
                    closeVideoModal();
                }
            });
        }

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && videoModal && videoModal.classList.contains('active')) {
                closeVideoModal();
            }
        });
    }
});
